# required testing for findutils >= 4.5
FROM debian:testing
MAINTAINER Iskaron <mail@iskaron.de>

ENV VERSION=2.25.1

RUN apt-get update && apt-get install -y wget bzip2 ghostscript openssh-client git && rm -rf /var/lib/apt/lists/*

WORKDIR /root

ADD https://gitlab.com/lilypond/lilypond/-/releases/v${VERSION}/downloads/lilypond-${VERSION}-linux-x86_64.tar.gz ./

RUN tar xf ./lilypond-${VERSION}-linux-x86_64.tar.gz && mv lilypond-${VERSION} /root/stable && rm lilypond-${VERSION}-linux-x86_64.tar.gz

COPY lilyfy.sh /root/stable/bin

ENV PATH /root/stable/bin:$PATH

