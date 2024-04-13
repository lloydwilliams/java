package com.datadoghq.test;

public class TestConversion2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		String id = "00-65e8be14000000004bdfe4d1c3c6eee7-ed5ace4db9a70b3b-01" ;
		
		String[] parts = id.split("-");
		
		String traceIdValue = parts[1] ;
		System.out.println("*** traceIdValue: " + traceIdValue);
		String spanid = parts[2] ;
		
		System.out.println("*** length: " + traceIdValue.length());
		
		
		String traceIdHexString = traceIdValue.substring(traceIdValue.length() - 16 );
		System.out.println("*** traceIdHexString: " + traceIdHexString);
		
		long datadogTraceId = Long.parseUnsignedLong(traceIdHexString, 16);
		String datadogTraceIdString = Long.toUnsignedString(datadogTraceId);
		
		String spanIdHexString = spanid ;
		long datadogSpanId = Long.parseUnsignedLong(spanIdHexString, 16);
		String datadogSpanIdString = Long.toUnsignedString(datadogSpanId);
		
		System.out.println("--------------------------");
		System.out.println("W3C: " + id);
		
		System.out.println("Datadog Trace ID: " + datadogTraceIdString);
		
		System.out.println("Datadog Span ID: " + datadogSpanIdString);
		
		System.out.println("--------------------------\n\n");
		
		/*
		 * 
		 * String traceIdValue = Span.current().getSpanContext().getTraceId();
String traceIdHexString = traceIdValue.substring(traceIdValue.length() - 16 );
long datadogTraceId = Long.parseUnsignedLong(traceIdHexString, 16);
String datadogTraceIdString = Long.toUnsignedString(datadogTraceId);

String spanIdHexString = Span.current().getSpanContext().getSpanId();
long datadogSpanId = Long.parseUnsignedLong(spanIdHexString, 16);
String datadogSpanIdString = Long.toUnsignedString(datadogSpanId);

logging.pattern.console = %d{yyyy-MM-dd HH:mm:ss} - %logger{36} - %msg dd.trace_id=%X{datadogTraceIdString} dd.span_id=%X{datadogSpanIdString} %n
		 */
		
	}

}
