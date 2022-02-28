FROM eclipse-temurin:11-jre-alpine

RUN apk --no-cache add --update bash openssl

RUN addgroup flyway && adduser -S -h /flyway -D -G flyway flyway

WORKDIR /flyway

ADD --chown=flyway:flyway flyway .

USER flyway

ENV PATH="/flyway:${PATH}"

ENTRYPOINT ["flyway"]
CMD ["-?"]