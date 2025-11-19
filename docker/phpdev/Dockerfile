FROM php:8.4-cli-alpine

ARG GIT_USER_EMAIL
ARG GIT_USER_NAME

RUN apk add --no-cache git
RUN git config --global user.email "$GIT_USER_EMAIL" && git config --global user.name "$GIT_USER_NAME"

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
COPY --from=ghcr.io/symfony-cli/symfony-cli:latest /usr/local/bin/symfony /usr/local/bin/symfony
