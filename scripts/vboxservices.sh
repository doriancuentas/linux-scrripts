#!/bin/bash
#start disabled services 
systemctl start vboxautostart-service.service
systemctl start vboxdrv.service
systemctl start vboxweb-service.service
systemctl start vboxballoonctrl-service.service
