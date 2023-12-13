#!/bin/sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home
# java -jar target/payroll-11.0.1.jar
# java -Xms256m -Xmx256m -Duser.timezone=UTC -jar target/payroll-11.0.1.jar
# 
# export JAVA_TOOL_OPTIONS="-javaagent:/Users/lloyd.williams/u01/datadog/dd-java-agent.jar"
# -Ddd.appsec.enabled=true \
# -Ddd.trace.methods=com.example.payroll.EmployeeController[*] \
# -Ddd.profiling.enabled=true -XX:FlightRecorderOptions=stackdepth=256 \

# https://docs.datadoghq.com/tracing/trace_collection/library_config/java/
# export DD_INTEGRATION_OPENTELEMETRY_EXPERIMENTAL_ENABLED=true
#  -Ddd.integration.opentelemetry.experimental.enabled=true \

$JAVA_HOME/bin/java -javaagent:/Users/lloyd.williams/u01/datadog/dd-java-agent.jar -Duser.timezone=UTC \
 -Ddd.trace.otel.enabled=true \
 -Ddd.logs.injection=true \
 -Ddd.service=otel-payroll -Ddd.source=otel-payroll -Ddd.env=dev -Ddd.version=11.0.0 \
 -jar target/otel-payroll-11.0.0.jar