#!/bin/bash
set -x
echo "Running tests"

export DISPLAY=:99
export MOZ_HEADLESS=1
export PATH=/usr/local/bin:/usr/bin:$PATH

which firefox
firefox --headless --version
which geckodriver
geckodriver --version
echo $PATH
ps -ef | grep Xvfb

poetry run python3 src/index.py &
echo "started Flask server"

while [[ "$(curl -s -o /dev/null -w '%{http_code}' localhost:5001)" != "200" ]]; do sleep 1; done
echo "Flask server is ready"

poetry run robot --variable BROWSER:firefox --variable HEADLESS:true --variable SELENIUM_TIMEOUT:30 src/tests

status=$?
kill $(lsof -t -i:5001)
exit $status