FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y curl git make python zip

RUN curl -O https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y esl-erlang elixir

RUN mkdir /var/build
WORKDIR /var/build

ADD . /mnt

CMD ["/mnt/build-plugin.sh"]
