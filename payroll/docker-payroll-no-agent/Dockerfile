FROM registry.suse.com/bci/bci-base:latest
RUN zypper refresh
RUN zypper -n install java-11-openjdk
# ADD https://dtdg.co/latest-java-tracer /dd-java-agent.jar
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} payroll.jar
COPY ./target/start.sh /start.sh
# LABEL com.datadoghq.ad.logs: '[{"source": "java", "service": "payroll", "auto_multi_line_detection": true}]'
RUN mkdir /logs
RUN chmod a+rx /logs
RUN chmod a+rx /start.sh
CMD ["sh", "/start.sh"]