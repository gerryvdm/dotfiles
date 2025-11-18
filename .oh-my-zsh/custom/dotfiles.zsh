php () {
  docker run --rm -it -v "$PWD":/app -w /app phpdev php "$@"
}

composer () {
  docker run --rm -it -v "$PWD":/app -w /app phpdev composer "$@"
}

symfony() {
  docker run --rm -it -v "$PWD":/app -w /app phpdev symfony "$@"
}
