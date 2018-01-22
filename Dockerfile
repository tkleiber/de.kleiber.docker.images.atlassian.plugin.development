FROM store/oracle/serverjre:8
MAINTAINER torsten.kleiber@web.de
ARG SW_FILE
COPY ${SW_FILE} /tmp/
RUN yum -y install xterm xauth libXtst wget tar gzip \
&& mkdir ideaIC \
&& tar zxf /tmp/${SW_FILE} --directory=ideaIC \
&& rm -f /tmp/${SW_FILE} \
&& wget https://sdkrepo.atlassian.com/atlassian-sdk-stable.repo -P /etc/yum.repos.d/ \
&& yum clean all \
&& yum updateinfo metadata \
&& yum -y install atlassian-plugin-sdk
&& ls -la ideaIC/idea-IC-173.4301.25/bin
CMD ideaIC/idea-IC-173.4301.25/bin/idea.sh
