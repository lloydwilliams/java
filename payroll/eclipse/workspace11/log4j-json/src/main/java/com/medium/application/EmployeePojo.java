package com.medium.application;

import java.util.Date;

public class EmployeePojo {
        private String name;
        private int employeeId;

        public EmployeePojo(String name, int employeeId) {
                this.name = name;
                this.employeeId = employeeId;
          
        }

        public String getName() {
                return name;
        }

        public void setName(String name) {
                this.name = name;
        }

        public int getEmployeeId() {
                return employeeId;
        }

        public void setEmployeeId(int employeeId) {
                this.employeeId = employeeId;
        }

      
}
