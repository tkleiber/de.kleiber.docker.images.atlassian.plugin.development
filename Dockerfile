FROM store/oracle/serverjre:8
MAINTAINER torsten.kleiber@web.de
ARG SW_FILE
USER root
ADD $SW_FILE /tmp/
ADD create_inventory.sh /tmp/
ADD silent.rsp /tmp/
USER root
RUN cd /etc/yum.repos.d/ \
&& wget https://sdkrepo.atlassian.com/atlassian-sdk-stable.repo \
&& yum clean all \
&& yum updateinfo metadata \
&& yum install atlassian-plugin-sdk
USER vagrant
RUN mkdir ~/ideaIC \
&& tar zxvf $SW_FILE ~/ideaIC
ls -la ~/ideaIC
CMD ~/ideaIC/idea
