# Unofficial image for Nexus 3
# https://support.sonatype.com/hc/en-us/articles/215781148
FROM java:8
MAINTAINER Anthony Dahanne <anthony.dahanne@gmail.com>
# downloading, untarring and removing the archive
RUN wget -q http://download.sonatype.com/nexus/3/nexus-3.0.0-m7-unix.tar.gz \
  && mkdir /nexus3 \
  && tar xzf nexus-3.0.0-m7-unix.tar.gz -C /nexus3 --strip-components=1 \
  && rm nexus-3.0.0-m7-unix.tar.gz
WORKDIR /nexus3

# copying jetty https config with "password" keystore password
COPY etc/jetty-https.xml etc/jetty-https.xml

# copying nexus config, with a reference to jetty-https.xml
COPY etc/org.sonatype.nexus.cfg etc/org.sonatype.nexus.cfg

RUN mkdir etc/ssl
RUN keytool -genkey -alias alias  -keyalg RSA -keystore etc/ssl/keystore.jks  -dname "cn=localhost, ou=IT, o=Continuent, c=CA"  -storepass password -keypass password

# nexus http port
EXPOSE 8081
# nexus https port
EXPOSE 8443
# docker internal registry port (to push to)
EXPOSE 18444
# docker proxy registry port (to pull from)
EXPOSE 18443

CMD ["bin/nexus", "run"]
