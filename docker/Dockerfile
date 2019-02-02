FROM golang:1.11.5-stretch

ENV TERM xterm-256color
ENV HOME /home/developer

RUN set -ex \
  && apt-get update \
  && apt-get -y install zsh \
  && apt-get -y install inotify-tools \
  && apt-get -y install sudo \
  && apt-get -y install nano \
  && apt-get -y install curl \
  && apt-get -y install git

RUN set -ex \
  && mkdir ${HOME} \
  && mkdir /work

RUN set -ex \
  && curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || true \
  && mkdir ${HOME}/.oh-my-zsh/custom/plugins/localalias \
  && ln -s /usr/share/localalias/localalias.zsh ${HOME}/.oh-my-zsh/custom/plugins/localalias/localalias.plugin.zsh

RUN chmod 666 /etc/passwd /etc/group

RUN wget -qO- https://binaries.cockroachdb.com/cockroach-v2.1.4.linux-amd64.tgz | tar  xvz

RUN cp -i cockroach-v2.1.4.linux-amd64/cockroach /usr/local/bin

COPY /home ${HOME}/

COPY /docker-entrypoint.d /etc/docker-entrypoint.d/

COPY /sudoers.d /etc/sudoers.d/

ENTRYPOINT ["/home/developer/docker-entrypoint.sh"]
