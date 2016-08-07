# vim: fdm=marker fdl=0
# vim: ft=zsh

# variables# {{{
export EDITOR="nvim"
export VISUAL='nvim'
export TERM="xterm-256color"
export PAGER="less"
export DOTFILE_ROOT=${HOME}/.dotfile
export ZSH_ROOT=${DOTFILE_ROOT}/zsh
export DOTFILE_BUNDLE_ROOT=${DOTFILE_ROOT}/gundle/
export INSTALL_ROOT=${HOME}/softs/install/
# }}}
function source_if_exist() { # {{{
  if [[ -f ${1} ]]; then
    source "$@" &> /dev/null
  fi
} # }}}
function prepend_PATH() { # {{{
  # only one path is allowed at a time
  if [[ -d "$1" ]]; then
    export PATH="$1:$PATH"
  fi
}
# }}}
function prepend_MANPATH() { # {{{
  # only one path is allowed at a time
  if [[ -d "$1" ]]; then
    export MANPATH="$1:$MANPATH"
  fi
}
# }}}
function prepend_INFOPATH() { # {{{
  # only one path is allowed at a time
  if [[ -d "$1" ]]; then
    export INFOPATH="$1:$INFOPATH"
  fi
}
# }}}
function prepend_LD_LIBRARY_PATH() { # {{{
  # only one path is allowed at a time
  if [[ -d "$1" ]]; then
    export LD_LIBRARY_PATH="$1:$LD_LIBRARY_PATH"
  fi
}
# }}}


# OS independent alias# {{{
# keep it in lexicographic order
alias gst='git status'
alias gpa='git remote | xargs -L1 git push'
alias sumcol='paste -sd+ - | bc'
alias ssh='ssh -Y'
# }}}

# OS independent PATH for softwares
# madagascar# {{{
source_if_exist ${INSTALL_ROOT}/madagascar/share/madagascar/etc/env.sh
export PYTHONPATH=$PYTHONPATH:$RSFSRC/build/book/Recipes
export DATAPATH=${HOME}/.rsfdata
# }}}
# ${HOME}/.dotfile/bin# {{{
prepend_PATH ${HOME}/.dotfile/bin
# }}}

# Settings for Linux and MAC
if [[ "$OSTYPE" == "linux-gnu" ]]; then # only set for Linux
# Linux alias# {{{
alias docker-stop-all='docker stop `docker ps -aq`'
alias docker-rm-all='docker rm `docker ps -aq`'
alias open='gnome-open'
# }}}
# CUDA# {{{
prepend_PATH ${INSTALL_ROOT}/cuda
# }}}
# boost# {{{
prepend_LD_LIBRARY_PATH ${INSTALL_ROOT}/boost/lib
# }}}
# matlab# {{{
prepend_PATH ${INSTALL_ROOT}/matlab/bin
# }}}
# maxcompiler# {{{
source_if_exist ${INSTALL_ROOT}/maxcompiler/settings.sh
prepend_PATH $MAXELEROSDIR/utils
# }}}
# texlive# {{{
prepend_PATH ${INSTALL_ROOT}/texlive/bin/x86_64-linux
prepend_MANPATH ${INSTALL_ROOT}/texlive/texmf/doc/man
# }}}
# linuxbrew# {{{
prepend_PATH "$HOME/.linuxbrew/bin"
prepend_PATH "$HOME/.linuxbrew/sbin"
prepend_MANPATH "$HOME/.linuxbrew/share/man"
prepend_INFOPATH "$HOME/.linuxbrew/share/info"
# }}}
elif [[ "$OSTYPE" == "darwin"* ]]; then # only set for MAC
# coreutils# {{{
prepend_PATH "$(brew --prefix coreutils)/libexec/gnubin"
# }}}
fi
