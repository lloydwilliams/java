package com.medium.application;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@SpringBootApplication
public class EmployeeApplication {

	private static Logger logger = LogManager.getLogger(EmployeeApplication.class.getName());
	
	
	public static void main(String[] args) {
		
		logger.info("Starting EmployeeApplication.");

		SpringApplication.run(EmployeeApplication.class, args);

	}

}
