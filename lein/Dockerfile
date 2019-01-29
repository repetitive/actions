FROM clojure:lein-alpine

LABEL name="lein"
LABEL version="1.0.0"
LABEL repository="http://github.com/repetitive/actions"
LABEL homepage="http://github.com/repetitive/actions"

LABEL maintainer="Anton Podviaznikov <anton@podviaznikov.com>"
LABEL com.github.actions.name="GitHub Action for Lein"
LABEL com.github.actions.description="Wraps Lein CLI to enable Boot commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="orange"
COPY LICENSE README.md /

RUN apk --no-cache add jq bash curl

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]