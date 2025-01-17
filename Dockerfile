FROM fuocnetwork/go-ethereum

ENV IP=127.0.0.1 \
  PORT=30301 \
  ID=145 \
  STATS_NAME=fuoc-archive-node \
  STATS_SECRET=secret \
  STATS_HOST=127.0.0.1 \
  STATS_PORT=3000

RUN echo 'geth --networkid $ID --port $PORT --nat extip:$IP --ethstats $STATS_NAME:$STATS_SECRET@$STATS_HOST:$STATS_PORT --syncmode full --gcmode archive --maxpeers 200 --miner.gasprice 30000000000 --miner.gaslimit 20000000 --txpool.nolocals --txpool.accountslots 16 --txpool.globalslots 131072 --txpool.accountqueue 16 --txpool.globalqueue 131072 --txpool.lifetime "1h30m0s" --metrics' >> geth.sh

ENTRYPOINT ["/bin/sh", "geth.sh"]
