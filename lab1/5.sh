#!/bin/bash
awk '{$2="INFO"; print}' /var/log/syslog > info.log
