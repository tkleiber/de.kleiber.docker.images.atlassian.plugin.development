FROM store/oracle/serverjre:8
MAINTAINER torsten.kleiber@web.de
ARG SW_FILE
ADD $SW_FILE /tmp/
RUN yum -y install xterm xauth libXtst wget tar
RUN wget https://sdkrepo.atlassian.com/atlassian-sdk-stable.repo -P /etc/yum.repos.d/
RUN yum clean all
RUN yum updateinfo metadata
RUN yum -y install atlassian-plugin-sdk
RUN mkdir ~/ideaIC
RUN tar zxvf $SW_FILE ~/ideaIC
RUN ls -la ~/ideaIC
CMD ~/ideaIC/idea
