#!/bin/bash
if [[ ! -f /opt/sonatype-work/nexus/conf/nexus.xml ]] ; then
    mkdir -p /opt/sonatype-work/nexus/conf/
    cp /opt/sonatype-default/nexus.xml  /opt/sonatype-work/nexus/conf/
    chown -R nexus:nexus  /opt/sonatype-work
fi
su -c "/opt/sonatype-nexus/bin/nexus console" - nexus
