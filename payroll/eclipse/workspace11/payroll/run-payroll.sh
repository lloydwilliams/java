#!/bin/sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home

# java -jar target/payroll-11.0.1.jar

# java -Xms256m -Xmx256m -Duser.timezone=UTC -jar target/payroll-11.0.1.jar

# -Duser.timezone=UTC
# -Ddd.appsec.enabled=true \

# -XX:FlightRecorderOptions=stackdepth=256 \
# -Ddd.profiling.enabled=true \

# -Dotel.java.global-autoconfigure.enabled=true \

# export JAVA_TOOL_OPTS="-javaagent:/Users/lloyd.williams/u01/datadog/dd-java-agent.jar"

$JAVA_HOME/bin/java -javaagent:/Users/lloyd.williams/u01/datadog/dd-java-agent.jar \
 -XX:FlightRecorderOptions=stackdepth=256 \
 -Ddd.profiling.enabled=true \
 -Ddd.profiling.ddprof.liveheap.enabled=true \
 -Ddd.profiling.directallocation.enabled=true \
 -Ddd.trace.methods=com.example.payroll.EmployeeController[*] \
 -Ddd.trace.propagation.style.inject=tracecontext,datadog \
 -Ddd.trace.propagation.style.extract=tracecontext,datadog \
 -Ddd.logs.injection=true \
 -Ddd.service=payroll -Ddd.source=payroll -Ddd.env=dev -Ddd.version=11.0.2 \
 -jar target/payroll-11.0.2.jar