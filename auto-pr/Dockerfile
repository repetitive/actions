FROM alpine

LABEL name="auto-pr"
LABEL version="1.0.0"
LABEL repository="http://github.com/repetitive/actions"
LABEL homepage="http://github.com/repetitive/actions"

LABEL maintainer="Anton Podviaznikov <anton@podviaznikov.com>"
LABEL com.github.actions.name="GitHub Action for automatically creating Pull Request"
LABEL com.github.actions.description="Create Pull Request when new branch is pushed"
LABEL com.github.actions.icon="git-pull-request"
LABEL com.github.actions.color="purple"
COPY LICENSE README.md /

RUN apk --no-cache add jq bash curl

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]