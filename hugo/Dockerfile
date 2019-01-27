FROM ruby:2.2

LABEL name="hugo"
LABEL version="1.0.0"
LABEL repository="http://github.com/repetitive/actions"
LABEL homepage="http://github.com/repetitive/actions"

LABEL maintainer="Anton Podviaznikov <anton@podviaznikov.com>"
LABEL com.github.actions.name="GitHub Action for building Hugo sites"
LABEL com.github.actions.description="Build Hugo website."
LABEL com.github.actions.icon="code"
LABEL com.github.actions.color="purple"
COPY LICENSE README.md /

RUN apt-get update
RUN apt-get install -y curl

ENV HUGO_VERSION 0.53
ENV HUGO_DL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
RUN curl -fsSL ${HUGO_DL} | tar xvz -C /usr/local/bin
RUN gem install asciidoctor

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]