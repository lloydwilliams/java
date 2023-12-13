package com.medium.application;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

@RestController
public class EmployeeController  {

    private static Logger loggerWithJsonLayout = LogManager.getLogger(EmployeeController.class.getName());

    @PostMapping(path = "/hello", produces ="application/json" , consumes = "application/json")
    public ResponseEntity<String> hello(@RequestBody Map<String, Object> requestBody){
        loggerWithJsonLayout.info(requestBody);
        loggerWithJsonLayout.info(createEmployeePojoMessage());
        return ResponseEntity.ok("request submitted");
    }

    @GetMapping("/employees")
    List<EmployeePojo> all() {
      
    	loggerWithJsonLayout.info("Getting all employees!!!");
  	  
  	  return null ;
  	  
    }
    
    @GetMapping("/error")
    void error() {
       
    //	System.out.println("Going to send an error!");
    	
    	loggerWithJsonLayout.info("Error");
   	  
   	  //return repository.findAll();
     }
    
    private EmployeePojo createEmployeePojoMessage() {
        return new EmployeePojo("hello", 12345);
    }

}