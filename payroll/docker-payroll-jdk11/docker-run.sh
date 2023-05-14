#!/bin/sh
# https://docs.datadoghq.com/containers/docker/log/?tab=javamultilinelogs#docker-container-log-collection-from-a-file
# https://docs.datadoghq.com/logs/guide/docker-logs-collection-troubleshooting-guide/

docker run -it --name payroll-suse-jdk11 --rm -p 8080:8080 lloydwilliams/payroll-suse-jdk11:11.0.1