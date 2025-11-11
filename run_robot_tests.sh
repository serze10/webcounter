#!/bin/bash

echo "Running tests"

# Käynnistetään Flask-palvelin taustalle
poetry run python3 src/index.py &

echo "started Flask server"

# Odotetaan, että palvelin on valmis
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:5001)" != "200" ]];
  do sleep 1;
done

echo "Flask server is ready"

# Suoritetaan testit Firefoxilla headless-tilassa
poetry run robot --variable BROWSER:firefox --variable HEADLESS:true src/tests

status=$?

# Pysäytetään Flask-palvelin
kill $(lsof -t -i:5001)

exit $status
