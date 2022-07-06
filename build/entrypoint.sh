#!/bin/sh

if [[ -n $OVERRIDE_TTD ]] && [[ $EXTRA_OPTS != *"--override.terminaltotaldifficulty"* ]]; then
  EXTRA_OPTS="--override.terminaltotaldifficulty=${OVERRIDE_TTD} ${EXTRA_OPTS}"
fi

exec -c geth --datadir /sepolia \ 
    --sepolia \
    --port ${P2P_PORT}
    --http \
    --http.addr 0.0.0.0 \
    --http.corsdomain "*" \
    --http.vhosts "*" \
    --ws \
    --ws.origins "*" \
    --ws.addr 0.0.0.0 \
    --authrpc.addr 0.0.0.0 \
    --authrpc.port 8551 \
    --authrpc.vhosts "*" \
    --authrpc.jwtsecret "/jwtsecret" \
    --syncmode ${SYNCMODE:-snap} \ 
    --metrics \
    --metrics.addr 0.0.0.0 \
    $EXTRA_OPTIONS
