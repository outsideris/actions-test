#!/bin/sh

ls -lha build/static/js/*.js  | awk '{print $5,$9}'

