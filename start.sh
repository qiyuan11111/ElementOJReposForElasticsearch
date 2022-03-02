#!/bin/sh
sudo su elasticsearch << EOF
/usr/local/src/elasticsearch-7.6.2/bin/elasticsearch -d
EOF
sleep 85
mongo-connector -m Element-mongodb:27017 -t Element-elasticsearch:9200 -d elastic2_doc_manager -a root -p ctguacm1234@
/bin/bash