FROM store/oracle/serverjre:8
MAINTAINER torsten.kleiber@web.de
ARG SW_FILE
ADD $SW_FILE /tmp/
RUN yum -y install install xterm xauth libXtst wget \
&& cd /etc/yum.repos.d/ \
&& wget https://sdkrepo.atlassian.com/atlassian-sdk-stable.repo \
&& yum clean all \
&& yum updateinfo metadata \
&& yum -y install atlassian-plugin-sdk \
&& mkdir ~/ideaIC \
&& tar zxvf $SW_FILE ~/ideaIC \
&& ls -la ~/ideaIC
CMD ~/ideaIC/idea
