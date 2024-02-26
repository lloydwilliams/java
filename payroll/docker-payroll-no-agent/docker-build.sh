#!/bin/sh
docker build -t lloydwilliams/payroll:11.1.0 .
sleep 5
docker images