FROM python:3.6

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN export PS1='@\h:\W $'

RUN mkdir -p /usr/src/app
ADD ./app /usr/src/app

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install bottle
RUN pip install requests

WORKDIR /usr/src/app
EXPOSE 5000

RUN groupadd -g 61000 docker
RUN useradd -g 61000 -l -m -s /bin/false -u 61000 docker

USER docker
CMD ["bash"]
