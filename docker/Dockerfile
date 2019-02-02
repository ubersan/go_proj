FROM golang:1.11.5-alpine3.8

ENV HOME /home/developer

RUN apk update \
  && apk add zsh \
  && apk add inotify-tools \
  && apk add sudo \
  && apk add nano \
  && apk add curl \
  && apk add git

RUN set -ex \
  && mkdir ${HOME} \
  && mkdir /work

RUN set -ex \
  && curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || true \
  && mkdir ${HOME}/.oh-my-zsh/custom/plugins/localalias \
  && ln -s /usr/share/localalias/localalias.zsh ${HOME}/.oh-my-zsh/custom/plugins/localalias/localalias.plugin.zsh

RUN chmod 666 /etc/passwd /etc/group

COPY /home ${HOME}/

COPY /docker-entrypoint.d /etc/docker-entrypoint.d/

COPY /sudoers.d /etc/sudoers.d/

ENTRYPOINT ["/home/developer/docker-entrypoint.sh"]
