#!/bin/sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
export OTEL_EXPORTER_OTLP_ENDPOINT=http://0.0.0.0:4317
export OTEL_EXPORTER_OTLP_TRACES_PROTOCOL=grpc
export JAVA_TOOL_OPTIONS="-javaagent:/Users/lloyd.williams/u01/otel/opentelemetry-javaagent.jar"
export OTEL_SERVICE_NAME=otel-payroll
export OTEL_METRICS_EXPORTER=none
#export OTEL_TRACES_EXPORTER=logging
export OTEL_TRACES_EXPORTER=otlp

echo ""
echo "starting otel-payroll\n"

java -Duser.timezone=UTC -jar target/otel-payroll-11.0.0.jar
