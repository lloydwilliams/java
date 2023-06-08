#!/bin/sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home

# java -jar target/payroll-11.0.1.jar

# java -Xms256m -Xmx256m -Duser.timezone=UTC -jar target/payroll-11.0.1.jar

# -Duser.timezone=UTC

$JAVA_HOME/bin/java -javaagent:/Users/lloyd.williams/u01/datadog/dd-java-agent.jar -XX:FlightRecorderOptions=stackdepth=256 \
 -Ddd.profiling.enabled=true -Ddd.trace.methods=com.example.payroll.EmployeeController[*] \
 -Ddd.appsec.enabled=true \
 -Ddd.logs.injection=true -Ddd.service=payroll -Ddd.source=payroll -Ddd.env=dev -Ddd.version=11.0.2 -jar target/payroll-11.0.2.jar