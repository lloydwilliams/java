#!/bin/sh

kill -9 $(lsof -t -i:8080)
