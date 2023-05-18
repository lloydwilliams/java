#!/bin/sh

# export $DATADOG_API_KEY=DATADOG_API_KEY
#               --network <NETWORK_NAME> \
# docs: https://docs.datadoghq.com/containers/docker/log/?tab=runcommand
# 
# labels:
#    com.datadoghq.ad.logs: '[{"type":"file", "source": "java", "service": "app", "path": "/logs/app/prod.log"}, {"type": "docker", "source": "app_container", "service": "app"}]'
#
#

## MacOS ##
# docker run -d --name datadog-agent \
#           --cgroupns host \
#           --pid host \
#           -e DD_API_KEY=<DATADOG_API_KEY> \
#           -e DD_LOGS_ENABLED=true \
#           -e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true \
#           -e DD_LOGS_CONFIG_DOCKER_CONTAINER_USE_FILE=true \
#           -e DD_CONTAINER_EXCLUDE="name:datadog-agent" \
#           -v /var/run/docker.sock:/var/run/docker.sock:ro \
#           -v /var/lib/docker/containers:/var/lib/docker/containers:ro \
#           -v /opt/datadog-agent/run:/opt/datadog-agent/run:rw \
#           gcr.io/datadoghq/agent:latest

# -v /var/run/docker.sock:/var/run/docker.sock:ro
# To connect to the Docker daemon to discover containers and collect stdout/stderr from the Docker socket.
# -v /var/lib/docker/containers:/var/lib/docker/containers:ro
# To collect containers logs from files. Available in the Datadog Agent 6.27.0/7.27.0+


# Datadog Agent
docker run -d --name datadog-agent \
              --cgroupns host \
              --pid host \
              -e DD_API_KEY=$DATADOG_API_KEY \
              -e DD_APM_ENABLED=true \
              -e DD_APM_NON_LOCAL_TRAFFIC=true \
              -e DD_LOGS_ENABLED=true \
              -e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true \
              -e DD_PROCESS_AGENT_ENABLED=true \
              -e DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true \
              -p 8126:8126 \
              -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
              -v /var/run/docker.sock:/var/run/docker.sock:ro \
              -v /var/lib/docker/containers:/var/lib/docker/containers:ro \
              -v /opt/datadog-agent/run:/opt/datadog-agent/run:rw \
              -v /proc/:/host/proc/:ro \
              -v /Users/lloyd.williams/u01/docker/logs:/logs \
              gcr.io/datadoghq/agent:latest