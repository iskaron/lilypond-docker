# required testing for findutils >= 4.5
FROM debian:testing
MAINTAINER Iskaron <mail@iskaron.de>

RUN apt-get update && apt-get install -y wget bzip2 ghostscript openssh-client git && rm -rf /var/lib/apt/lists/*

WORKDIR /root

ADD https://lilypond.org/download/binaries/linux-64/lilypond-2.22.1-1.linux-64.sh ./
RUN chmod +x lilypond-2.20.0-1.linux-64.sh
RUN ./lilypond-2.22.1-1.linux-64.sh --batch --prefix /root/stable
RUN rm lilypond-2.22.1-1.linux-64.sh
COPY lilyfy.sh /root/stable/bin

ENV PATH /root/stable/bin:$PATH

