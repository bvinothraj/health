#!/bin/bash

if [[ ! -e "./nodedata/healthchain.json" && ! -d "./nodedata/geth/chaindata" ]]; then
	echo "Initializing chain..."
	mkdir nodedata
	mkdir nodedata/geth
	cp healthchain.json nodedata/healthchain.json
	#cp static-nodes.json nodedata/geth/static-nodes.json
	cp bootnode.key nodedata/geth/bootnode.key
	geth --datadir nodedata init nodedata/healthchain.json
else
	echo "Already initialized...starting up..."
fi

geth --datadir nodedata \
	 --nodekey bootnode.key \
	 --syncmode "full" \
	 --netrestrict "172.19.0.0/16" \
	 --port 30311 \
	 --rpc \
	 --rpcaddr '0.0.0.0' \
	 --rpcport 8502 \
	 --rpcapi 'personal,db,eth,net,web3,txpool,miner,clique,admin' \
	 --rpccorsdomain '*' \
	 --miner.gaslimit 90000000 \
	 --miner.gasprice 1000