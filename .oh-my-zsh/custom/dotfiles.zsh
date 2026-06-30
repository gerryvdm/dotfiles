eval "$(/opt/homebrew/bin/brew shellenv zsh)"
export PATH="$HOME/.local/bin:$PATH"

_docker_run() {
  local tty=; [ -t 0 ] && [ -t 1 ] && tty=-t
  docker run --rm -i $tty -v "$PWD":/app -w /app "$@"
}

make() {
  if [ "$PWD" = "$HOME" ] && [ ! -f Makefile ]; then
    command make -C "$HOME/.dotfiles" "$@"
  else
    command make "$@"
  fi
}

php()      { _docker_run phpdev php "$@"; }
composer() { _docker_run phpdev composer "$@"; }
symfony()  { _docker_run phpdev symfony "$@"; }
yarn()     { _docker_run node:current-alpine yarn "$@"; }
