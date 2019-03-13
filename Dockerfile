FROM openjdk:8
MAINTAINER dev@flexio.fr

ARG JANUSGRAPH_VERSION
ENV VERSION=${JANUSGRAPH_VERSION}

ENV SERVER_ZIP=janusgraph-${VERSION}-hadoop2.zip

ADD ${SERVER_ZIP} /var

RUN apt-get update -y && apt-get install -y zip && \
    SERVER_BASE=`basename ${SERVER_ZIP} .zip` && \
    unzip -q /var/${SERVER_BASE}.zip -d /var && \
    ln -s /var/${SERVER_BASE} /var/janusgraph

ADD gremlin-server-plain-berkeleyje.yaml /var/janusgraph/conf/gremlin-server

WORKDIR /var/janusgraph

CMD ["./bin/gremlin-server.sh", "./conf/gremlin-server/gremlin-server-plain-berkeleyje.yaml"]
