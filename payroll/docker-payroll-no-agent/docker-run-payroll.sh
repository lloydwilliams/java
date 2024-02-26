#!/bin/sh
# https://docs.datadoghq.com/containers/docker/log/?tab=javamultilinelogs#docker-container-log-collection-from-a-file
# https://docs.datadoghq.com/logs/guide/docker-logs-collection-troubleshooting-guide/

#        -e JAVA_TOOL_OPTIONS="-javaagent:/dd-java-agent.jar" \

docker run -it --name payroll \
       --rm -p 8080:8080 \
       lloydwilliams/payroll:11.1.0