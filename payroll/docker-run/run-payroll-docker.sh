#!bin/sh

#
# Application
# docker run -d --name app \
#              --network <NETWORK_NAME> \
#              -e DD_AGENT_HOST=datadog-agent 
#              -e DD_TRACE_AGENT_PORT=8126
#              company/app:latest

# -l com.datadoghq.ad.logs='[<LOGS_CONFIG>]'

docker run -d --name payroll-suse-jdk11 \
           -e DD_AGENT_HOST=datadog-agent \
           -e DD_TRACE_AGENT_PORT=8126 \
           -e JAVA_TOOL_OPTIONS="-javaagent:/dd-java-agent.jar" \
           -e JAVA_OPTS="-XX:FlightRecorderOptions=stackdepth=256" \
           -e DD_SERVICE=payroll \
           -e DD_ENV=dev \
           -e DD_VERSION=11.0.1 \
           -e DD_TAGS=app:payroll \
           -e DD_PROFILING_ENABLED=true \
           -e DD_PROFILING_DDPROF_MEMLEAK_ENABLED=true \
           -p 2022:22 \
           -p 8080:8080 \
           -l com.datadoghq.ad.logs='[{"type":"file", "source": "payroll-docker", "service": "payroll", "path": "/logs/payroll-app.log"}]' \
           -v /Users/lloyd.williams/u01/docker/logs:/logs \
           lloydwilliams/payroll-suse-jdk11:11.0.1