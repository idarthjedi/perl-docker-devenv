FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential\
	git zsh curl wget locales

ENV LANG="en_US.UTF-8"

ENV LANGUAGE="en_US.UTF-8"

RUN dpkg-reconfigure --frontend=noninteractive locales

RUN useradd -ms /bin/bash perlu

USER perlu

WORKDIR /home/perlu

RUN git clone https://github.com/tokuhirom/plenv.git ~/.plenv && git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/

SHELL ["/bin/bash", "-l", "-c"]

RUN echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> ~/.bash_profile

RUN echo 'eval "$(plenv init -)"' >> ~/.bash_profile

RUN eval "$(plenv init -)" && plenv install 5.36.0

RUN plenv global 5.36.0

RUN plenv install-cpanm 

RUN cpanm install Perl::LanguageServer

WORKDIR projects

CMD source ~/.bash_profile && /bin/bash -l


#update-locale LANG=en_US.UTF-8 && update-locale LANGUAGE=en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8
