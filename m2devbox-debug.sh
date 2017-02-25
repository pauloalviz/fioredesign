#!/bin/bash

ssh_port=$(docker port magento2devbox_web_c34677f3da19131a5906e3eebf672dc4 22)
ssh_port=${ssh_port#*:}

ssh -N -p $ssh_port -R 9000:localhost:9000 magento2@127.0.0.1