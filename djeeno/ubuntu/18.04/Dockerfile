FROM ubuntu:18.04

LABEL maintainer="djeeno <29125616+djeeno@users.noreply.github.com>"

ENV DEBIAN_FRONTEND noninteractive

##
# locale
##
RUN set -x \
  && apt-get update \
  && apt-get install -y locales \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
  && set +x

ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8" PATH="/usr/local/bin:$PATH"

##
# common
##
RUN set -x \
  && apt-get update \
  && apt-get install -y bash-completion curl ssh sudo vim wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && set +x

##
# git
##
RUN set -x \
  && curl -LRsS https://sh.djeeno.com/git/ | bash \
  && /usr/local/bin/git --version \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && set +x

RUN set -x \
  && curl -fLRSs https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash \
  && curl -fLRSs https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh \
  && echo 'test -f ~/.git-completion.bash && source "$_"' >> ~/.bashrc \
  && echo 'test -f ~/.git-prompt.sh && source "$_"' >> ~/.bashrc \
  && echo '#export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWUPSTREAM=1 GIT_PS1_SHOWUNTRACKEDFILES=1 GIT_PS1_SHOWSTASHSTATE=1; if [ "${BASH_VERSINFO[0]}" -ge 4 ]; then export PS1="${PS1//"\\\$"/\\\$\\\[\\\e[1;31m\\\]\$(__git_ps1)\\\[\\\e[00m\\\]}"; else export PS1="${PS1//"\\\$"/\$\[\e[1;31m\]\$(__git_ps1)\[\e[00m\]}"; fi' >> ~/.bashrc
  && set +x
