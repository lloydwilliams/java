When you use Datadog AutoInjection for Connecting Traces and Logs, the trace id and span id are available in the [Mapped Diagnostic Context (MDC)](https://logback.qos.ch/manual/mdc.html). You can get also get the Datadog env, service and version values, if they were set according to the best practices.

```
<Pattern>%d{yyyy-MM-dd'T'HH:mm:ss.SSSZ} %-5p %c{1}:%L - %X{dd.trace_id} %X{dd.span_id} %X{dd.env} %X{dd.service} %X{dd.version} - %m%n</Pattern>           
```

but just the trace id is all that’s really needed for connecting logs and APM traces:

```
<Pattern>%d{yyyy-MM-dd'T'HH:mm:ss.SSSZ} %-5p [%thread] [%c{1} %method:%L] [%X{dd.trace_id}] %m%n</Pattern>       
```

https://github.com/lloydwilliams/java/blob/main/payroll/eclipse/workspace11/payroll/src/main/resources/logback-spring.xml



Then run it with:

```
-Ddd.logs.injection=true
```

https://github.com/lloydwilliams/java/blob/main/payroll/eclipse/workspace11/payroll/run-payroll.sh



OR

minimize the amount of changes that you make for APM by using env variables:

use `JAVA_TOOL_OPTIONS` to add the tracer. This will automatically be found by Java.

```
JAVA_TOOL_OPTIONS=-javaagent:/dd-java-agent.jar
```

Just like this jar automatically will find the env var:

```
DD_LOGS_INJECTION=true
```

then you just need to modify the log conversion pattern, there’s no way around that.
https://docs.datadoghq.com/logs/log_collection/java/?tab=log4j#raw-format



then add a Datadog Log Pipeline Processor with a Grok Parsing Rule corresponding to your pattern that extracts the trace id.

`payroll1 %{date("yyyy-MM-dd'T'HH:mm:ss.SSSZ"):date}\s+%{word:level}\s+\[%{data:java.thread}\]\s+\[%{data:java.class}\s+%{data:java.method}:%{number:java.line}\]\s+\[%{word:dd.trace_id}?\]\s+%{data:msg}`

then a Trace Id Remapper setting the trace id attribute to:

```
dd.trace_id
```





**[logback-spring.xml](https://github.com/lloydwilliams/java/blob/main/payroll/eclipse/workspace11/payroll/src/main/resources/logback-spring.xml)**

![<https://github.com/lloydwilliams/java|lloydwilliams/java>](https://slack-imgs.com/?c=1&o1=wi32.he32.si&url=https%3A%2F%2Fslack.github.com%2Fstatic%2Fimg%2Ffavicon-neutral.png)[lloydwilliams/java](https://github.com/lloydwilliams/java) | Added by [GitHub](https://dd.slack.com/services/B01UE8GJNHG)

**[run-payroll.sh](https://github.com/lloydwilliams/java/blob/main/payroll/eclipse/workspace11/payroll/run-payroll.sh)**

![<https://github.com/lloydwilliams/java|lloydwilliams/java>](https://slack-imgs.com/?c=1&o1=wi32.he32.si&url=https%3A%2F%2Fslack.github.com%2Fstatic%2Fimg%2Ffavicon-neutral.png)[lloydwilliams/java](https://github.com/lloydwilliams/java) | Added by [GitHub](https://dd.slack.com/services/B01UE8GJNHG)