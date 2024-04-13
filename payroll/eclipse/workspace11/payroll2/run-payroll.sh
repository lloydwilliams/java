#!/bin/sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home

# https://docs.datadoghq.com/tracing/trace_collection/library_config/java/
export DD_TRACE_AGENT_PORT=8136

# export DD_TRACE_128_BIT_TRACEID_GENERATION_ENABLED=true

# java -jar target/payroll-11.0.1.jar

# java -Xms256m -Xmx256m -Duser.timezone=UTC -jar target/payroll-11.0.1.jar

# -Duser.timezone=UTC
# -Ddd.appsec.enabled=true \

# -XX:FlightRecorderOptions=stackdepth=256 \
# -Ddd.profiling.enabled=true \

# -Dotel.java.global-autoconfigure.enabled=true \

# export JAVA_TOOL_OPTS="-javaagent:/Users/lloyd.williams/u01/datadog/dd-java-agent.jar"

# -Ddd.trace.propagation.style.inject=tracecontext,datadog \
# -Ddd.trace.propagation.style.extract=tracecontext,datadog \

# HTTP HEADERS
# traceparent
# x-datadog-trace-id

# https://docs.datadoghq.com/tracing/other_telemetry/connect_logs_and_traces/opentelemetry?tab=java
# https://github.com/open-telemetry/opentelemetry-java-instrumentation/blob/main/docs/logger-mdc-instrumentation.md
# Frameworks
# Spring Boot
# For Spring Boot configuration which uses logback, you can add MDC to log lines by overriding only the logging.pattern.level:
# logging.pattern.level = trace_id=%mdc{trace_id} span_id=%mdc{span_id} trace_flags=%mdc{trace_flags} %5p
# https://github.com/open-telemetry/opentelemetry-java-instrumentation/tree/main/instrumentation/logback/logback-mdc-1.0/library

export DD_TRACE_PROPAGATION_STYLE_EXTRACT=tracecontext,datadog
export DD_TRACE_PROPAGATION_STYLE_INJECT=tracecontext,datadog

$JAVA_HOME/bin/java -javaagent:/Users/lloyd.williams/u01/datadog/dd-java-agent.jar \
 -Ddd.trace.methods=com.example.payroll.EmployeeController[*] \
 -Ddd.logs.injection=true \
 -Ddd.service=payroll -Ddd.source=payroll -Ddd.env=dev -Ddd.version=11.0.2 \
 -jar target/payroll-11.0.2.jar