#!/bin/bash
nvm use 0.10.0 &&
redis-commander &
./bin/request_processor &
redmon
