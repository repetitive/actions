FROM clojure:tools-deps-alpine

LABEL name="clojure"
LABEL version="1.0.0"
LABEL repository="http://github.com/repetitive/actions"
LABEL homepage="http://github.com/repetitive/actions"

LABEL maintainer="Anton Podviaznikov <anton@podviaznikov.com>"
LABEL com.github.actions.name="GitHub Action for invoking Clojure REPL"
LABEL com.github.actions.description="Eval Clojure code on '/clojure' comment"
LABEL com.github.actions.icon="git-pull-request"
LABEL com.github.actions.color="purple"
COPY LICENSE README.md /

RUN apk --no-cache add jq bash curl

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]