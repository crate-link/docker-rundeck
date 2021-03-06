FROM adoptopenjdk/openjdk8:slim

ENV RUNDECK_VER=3.3.10-20210301 RUNDECK_HOME=/opt/rundeck PATH=/opt/rundeck/tools/bin:${PATH} LANG=C.UTF-8

RUN set -x \
 && mkdir -p ${RUNDECK_HOME} \
 && cd ${RUNDECK_HOME} \
 && curl -fsSL "https://dl.bintray.com/rundeck/rundeck-maven/org/rundeck/rundeck/rundeck-${RUNDECK_VER}.war" -o rundeck.war \
 && java -jar rundeck.war --installonly

VOLUME [ "/opt/rundeck/etc", "/opt/rundeck/libext", "/opt/rundeck/projects", "/opt/rundeck/server/config", "/opt/rundeck/server/data", "/opt/rundeck/server/logs", "/opt/rundeck/server/work", "/opt/rundeck/var" ]

EXPOSE 4440 4443

WORKDIR /opt/rundeck

CMD [ "java", "-jar", "rundeck.war" ]

