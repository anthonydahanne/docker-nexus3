# Unofficial Nexus 3 OSS image definition

### warning : the keystore used for https certificates is using a default "password" password, and the Nexus3 admin password is the default (admin123) - only use this image for testing !

## Nexus 3 official links

[https://support.sonatype.com/hc/en-us/articles/215781148](https://support.sonatype.com/hc/en-us/articles/215781148)

[http://www.sonatype.org/nexus/2016/01/21/ground-control-to-nexus-users-nexus-repository-manager-3-milestone-7-release/](http://www.sonatype.org/nexus/2016/01/21/ground-control-to-nexus-users-nexus-repository-manager-3-milestone-7-release/)


## To run : 

    $ docker run -d -p 80:8081 -p 443:8443 -p 18443:18443 -p 18444:18444  --name nexus3 nexus3
    
It takes more than 5 mn to fully start the first time, be patient and wait for :


    -------------------------------------------------
    
    Started Sonatype Nexus OSS 3.0.0-b2016011501
    
    -------------------------------------------------

You can now access Nexus3 on http://dockerhost or https://dockerhost


## To use as a Docker registry

You need to configure 3 docker repos (hosted docker-internal, group docker-all and proxy docker-hub). Watch this video that explains it all :

[https://www.youtube.com/watch?v=Z2jH9LgeeI8](https://www.youtube.com/watch?v=Z2jH9LgeeI8)

or read the documentation :

[https://books.sonatype.com/nexus-book/3.0/reference/docker.html](https://books.sonatype.com/nexus-book/3.0/reference/docker.html)

Don't forget to enable Docker V1 API !

## To build :     

    $ docker build -t nexus3 .
    