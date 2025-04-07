#!/bin/bash

ansible-playbook --ask-become-pass ../playbooks/update-shutdown.yml && sleep 5 && shutdown now
