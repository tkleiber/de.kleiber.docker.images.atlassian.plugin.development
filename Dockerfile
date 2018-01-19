FROM store/oracle/serverjre:8
MAINTAINER torsten.kleiber@web.de
ARG SW_FILE
COPY ${SW_FILE} /tmp/
RUN yum -y install xterm xauth libXtst wget tar \
&& mkdir ideaIC \
&& ls -la ideaIC \
&& ls -la /tmp/${SW_FILE}
# && tar zxvf /tmp/${SW_FILE} --directory=ideaIC \
# && rm -f /tmp/${SW_FILE} \
# && ls -la ideaIC \
# && wget https://sdkrepo.atlassian.com/atlassian-sdk-stable.repo -P /etc/yum.repos.d/ \
# && yum clean all \
# && yum updateinfo metadata \
# && yum -y install atlassian-plugin-sdk
# CMD ideaIC/idea
