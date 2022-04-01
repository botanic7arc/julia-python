FROM python:3
USER root

RUN apt-get update
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.2-linux-x86_64.tar.gz
RUN tar -zxvf julia-1.7.2-linux-x86_64.tar.gz
RUN mv julia-1.7.2 /opt/
RUN ln -s /opt/julia-1.7.2/bin/julia /usr/local/bin/julia