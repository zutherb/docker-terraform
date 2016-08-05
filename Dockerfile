FROM hashicorp/terraform:0.6.16
MAINTAINER "codecentric"

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]