#!/bin/bash

if [[ ! -e "./nodedata/healthchain.json" && ! -d "./nodedata/geth/chaindata" ]]; then
	echo "Initializing chain..."
	mkdir nodedata
	mkdir nodedata/keystore
	mkdir nodedata/geth
	cp keystore/* nodedata/keystore
	cp healthchain.json nodedata/healthchain.json
	#cp static-nodes.json nodedata/geth/static-nodes.json
	cp node3.key nodedata/geth/node3.key
	geth --datadir nodedata init nodedata/healthchain.json
else
	echo "Already initialized...starting up..."
fi

geth --datadir nodedata \
	 --nodekey node3.key \
	 --bootnodes 'enode://cd053e41ddb45380492927c918d432dd8f1326570e6175523539fbb415d4ebc5f30754c83d107c3105f4a01d0fd9a0f4305aedac7f33bfdfe7bbf5806e7798e6@172.19.1.1:30311' \
	 --netrestrict "172.19.0.0/16" \
	 --port 30311 \
	 --rpc \
	 --rpcaddr '0.0.0.0' \
	 --rpcport 8502 \
	 --rpcapi 'personal,db,eth,net,web3,txpool,miner,clique,admin' \
	 --rpccorsdomain '*' \
	 --unlock '0' \
	 --password pp.txt \
	 --mine \
	 --allow-insecure-unlock