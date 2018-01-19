FROM store/oracle/serverjre:8
MAINTAINER torsten.kleiber@web.de
ARG SW_FILE
USER root
ADD $SW_FILE /tmp/
RUN sudo yum -y install install xterm xauth libXtst wget \
&& cd /etc/yum.repos.d/ \
&& sudo wget https://sdkrepo.atlassian.com/atlassian-sdk-stable.repo \
&& sudo yum clean all \
&& sudo yum updateinfo metadata \
&& sudo yum -y install atlassian-plugin-sdk \
&& mkdir ~/ideaIC \
&& tar zxvf $SW_FILE ~/ideaIC \
&& ls -la ~/ideaIC
CMD ~/ideaIC/idea
