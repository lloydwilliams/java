/*
 *  https://spring.io/guides/tutorials/rest/
 */

package com.example.payroll;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.opentelemetry.api.GlobalOpenTelemetry;
import io.opentelemetry.api.trace.Span;
import io.opentelemetry.api.trace.Tracer;
import io.opentelemetry.context.Context;


@RestController
class EmployeeController {

	private static final Tracer tracer = GlobalOpenTelemetry.getTracer("instrumentation-library-name", "1.0.0");
	
	private static final Logger logger = LoggerFactory.getLogger(PayrollApplication.class);
	
	private final EmployeeRepository repository;

  EmployeeController(EmployeeRepository repository) {
    this.repository = repository;
  }


  // Aggregate root
  // tag::get-aggregate-root[]
  @GetMapping("/employees")
  List<Employee> all() {
    
	  logger.info("Getting all employees!!!");
	  
	  return repository.findAll();
  }
  // end::get-aggregate-root[]

  @PostMapping("/employees")
  Employee newEmployee(@RequestBody Employee newEmployee) {
    
	  logger.info("Adding new employee: " + newEmployee.getName());
	  
	  Span newEmployeeSpan = tracer.spanBuilder("NewEmployee").startSpan();
	  
	  Employee emp = repository.save(newEmployee);
	 
	  newEmployeeSpan.end();
	  
	  return emp ;
  }

  
  // Single item
  
  @GetMapping("/employees/{id}")
  Employee one(@PathVariable Long id) {
	
	logger.info("Getting employee with id: " + id);
	  
    return repository.findById(id)
      .orElseThrow(() -> new EmployeeNotFoundException(id));
  }

  @PutMapping("/employees/{id}")
  Employee replaceEmployee(@RequestBody Employee newEmployee, @PathVariable Long id) {
    
	 logger.info("Replacing employee with id: " + id);
	  
	  
    return repository.findById(id)
      .map(employee -> {
        employee.setName(newEmployee.getName());
        employee.setRole(newEmployee.getRole());
        return repository.save(employee);
      })
      .orElseGet(() -> {
        newEmployee.setId(id);
        return repository.save(newEmployee);
      });
  }

  @DeleteMapping("/employees/{id}")
  void deleteEmployee(@PathVariable Long id) {
	  
	  logger.info("Deleting employee with id: " + id);
	  
	  repository.deleteById(id);
  }
}