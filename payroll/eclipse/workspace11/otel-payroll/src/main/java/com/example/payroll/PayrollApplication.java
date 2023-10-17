package com.example.payroll;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import org.slf4j.MDC;

import io.opentelemetry.sdk.OpenTelemetrySdk;

//import io.opentelemetry.api.*;

import io.opentelemetry.sdk.resources.Resource;
import io.opentelemetry.sdk.trace.SdkTracerProvider;
import io.opentelemetry.sdk.trace.export.BatchSpanProcessor;
import io.opentelemetry.semconv.ResourceAttributes;
import io.opentelemetry.api.trace.Span;
import io.opentelemetry.api.trace.Tracer;
import io.opentelemetry.api.trace.propagation.W3CTraceContextPropagator;
import io.opentelemetry.context.Scope;
import io.opentelemetry.context.propagation.ContextPropagators;
import io.opentelemetry.exporter.otlp.trace.OtlpGrpcSpanExporter;
//import io.opentelemetry.api.GlobalOpenTelemetry;
import io.opentelemetry.api.OpenTelemetry;
import io.opentelemetry.api.common.Attributes;

@SpringBootApplication
public class PayrollApplication {

	private static final Logger logger = LoggerFactory.getLogger(PayrollApplication.class);
	
	/*
	static {
        // Obtain an OpenTelemetry tracer.
        Resource resource = Resource.getDefault()
                .merge(Resource.create(Attributes.of(
                        ResourceAttributes.SERVICE_NAME, "<logical-service-name>",
                        ResourceAttributes.HOST_NAME, "<host-name>"
                )));

        SdkTracerProvider sdkTracerProvider = SdkTracerProvider.builder()
                .addSpanProcessor(BatchSpanProcessor.builder(OtlpGrpcSpanExporter.builder()
                        .setEndpoint("<endpoint>")
                        .addHeader("Authentication", "<token>")
                        .build()).build())
                .setResource(resource)
                .build();

        OpenTelemetry openTelemetry = OpenTelemetrySdk.builder()
                .setTracerProvider(sdkTracerProvider)
                .setPropagators(ContextPropagators.create(W3CTraceContextPropagator.getInstance()))
                .buildAndRegisterGlobal();

        tracer = openTelemetry.getTracer("my_tracer_name", "1.0.0");
    }
    */

    private static Tracer tracer;

    public static Tracer getTracer() {
        return tracer;
    }

		
	
	public static void main(String[] args) throws InterruptedException {
		
		//Tracer tracer = GlobalOpenTelemetry.getTracer("instrumentation-library-name", "1.0.0");
		
		OpenTelemetry openTelemetry = OpenTelemetrySdk.builder().build();
		
		tracer = openTelemetry.getTracer("my_tracer_name", "1.0.0");
	

		logger.info("Starting payroll application.");
		
		Span span = tracer.spanBuilder("payroll-application").startSpan();

		// Make the span the current span
		try (Scope ss = span.makeCurrent()) {
		    // In this scope, the span is the current/active span
			logger.info("waiting a second in a span.");
			
			Thread.sleep(1000);
			
		} finally {
		    span.end();
		}

		SpringApplication.run(PayrollApplication.class, args);

	}

}
