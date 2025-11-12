#!/bin/bash
set -x
echo "Running tests"

export DISPLAY=:99
export PATH=/usr/local/bin:/usr/bin:$PATH

# Debug
which firefox
firefox --version
which geckodriver
geckodriver --version
echo $PATH
ps -ef | grep Xvfb

# Käynnistetään Flask-palvelin taustalle
poetry run python3 src/index.py &
echo "started Flask server"

# Odotetaan, että palvelin on valmis
while [[ "$(curl -s -o /dev/null -w '%{http_code}' localhost:5001)" != "200" ]]; do sleep 1; done
echo "Flask server is ready"

# Suoritetaan testit Firefoxilla headless-tilassa ja pidemmällä timeoutilla
poetry run robot --variable BROWSER:firefox --variable HEADLESS:true --variable SELENIUM_TIMEOUT:30 src/tests

status=$?
kill $(lsof -t -i:5001)
exit $status