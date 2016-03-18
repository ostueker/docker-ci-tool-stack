#
# Creates a docker container with Nexus Artifact Repository
#

FROM centos:6

MAINTAINER Marcel Birkner <marcel.birkner@codecentric.de>

USER root
# Update the system
RUN yum -y update; \
    yum clean all

##########################################################
# Install Java JDK, SSH and other useful cmdline utilities
##########################################################
RUN yum -y install java-1.8.0-openjdk-devel \
    which \
    telnet \
    unzip \
    openssh-server \
    sudo \
    openssh-clients \
    iputils \
    iproute \
    httpd-tools \
    wget \
    tar; \
    yum clean all
ENV JAVA_HOME /usr/lib/jvm/jre

##########################################################
# Install Nexus
##########################################################
RUN mkdir -p /opt/sonatype-nexus /opt/sonatype-work /opt/sonatype-default
RUN wget -O /tmp/nexus-latest-bundle.tar.gz http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz
RUN tar xzvf /tmp/nexus-latest-bundle.tar.gz -C /opt/sonatype-nexus --strip-components=1
RUN useradd --user-group --system --home-dir /opt/sonatype-nexus nexus

ADD nexus.xml      /opt/sonatype-default/nexus.xml
RUN chown -R nexus:nexus /opt/sonatype-work /opt/sonatype-default /opt/sonatype-nexus

ADD start-nexus.sh /opt/start-nexus.sh
RUN chmod +rx /opt/start-nexus.sh

ENV NEXUS_WEBAPP_CONTEXT_PATH /nexus
VOLUME ["/opt/sonatype-work"]

CMD ["/opt/start-nexus.sh"]
EXPOSE 8081
