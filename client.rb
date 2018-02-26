#!/usr/bin/env ruby

require 'bunny'
require 'jwt'

def gen_jwt
  payload = {
    :exp => Time.new.to_i + 60,
    :scope => ['rabbitmq.read:%2F/celery'],  # %2F => /
    :aud => ['rabbitmq'],
  }
  JWT.encode payload, 'secret', 'HS256'
end

def main
  begin
    conn = Bunny.new :user => gen_jwt, :log_level => Logger::FATAL
    q = conn.start.create_channel.queue 'celery', :passive => true
    q.subscribe do |delivery_info, properties, payload|
      puts "Received #{payload}, properties: #{properties}"
    end
  rescue => error
    puts error
  else
    puts "Success!"
  ensure
    conn.stop
  end
end

main
