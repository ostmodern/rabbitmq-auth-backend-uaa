#!/usr/bin/env ruby

require 'bunny'
require 'jwt'

def gen_jwt
  payload = {
    :exp => Time.new.to_i + 60,
    :scope => ['rabbitmq.read:%2F/celery'],  # %2F => /
    :aud => ['rabbitmq'],
    :kid => 'legacy-token-key',
    :iss => 'test',
  }
  secret = 'secret'
  JWT.encode payload, secret, 'HS256'
end

def connect(jwt)
  conn = Bunny.new :user => jwt, :log_level => Logger::FATAL
  conn.start
  ch = conn.create_channel
  ch.queue 'celery', :durable => true, :passive => true
end

def main
  begin
    jwt = gen_jwt
    q = connect jwt
    q.subscribe do |delivery_info, properties, payload|
      puts "Received #{payload}, properties: #{properties}"
    end
  rescue Bunny::TCPConnectionFailedForAllHosts => error
    puts "Failed to connect: #{error}"
  rescue Bunny::AuthenticationFailureError => error
    puts "Failed to authenticate: #{error}"
  rescue Bunny::NotAllowedError => error
    puts "Connection forbidden: #{error}"
  rescue Bunny::AccessRefused => error
    puts "Access refused: #{error}"
  else
    puts "Success!"
  end
end

main
