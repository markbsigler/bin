#!/bin/bash
# update all python pkg
sudo -H pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo -H pip install -U
