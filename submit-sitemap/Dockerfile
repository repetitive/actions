FROM alphine

LABEL name="submit-sitemal"
LABEL version="1.0.0"
LABEL repository="http://github.com/repetitive/actions"
LABEL homepage="http://github.com/repetitive/actions"

LABEL maintainer="Anton Podviaznikov <anton@podviaznikov.com>"
LABEL com.github.actions.name="GitHub Action to submit sitemap.xml to Google"
LABEL com.github.actions.description="Submit sitemap.xml to Google Webmaster tools"
LABEL com.github.actions.icon="code"
LABEL com.github.actions.color="purple"
COPY LICENSE README.md /

RUN apk --no-cache add curl

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]