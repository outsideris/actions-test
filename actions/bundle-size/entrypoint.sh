#!/bin/sh

sh -c "ls -lha build/static/js/*.js  | awk '{print $5,$9}'"

