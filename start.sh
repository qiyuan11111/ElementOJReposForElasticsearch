#!/bin/sh
echo 555555555
sudo su elasticsearch -c "/usr/local/src/elasticsearch-5.0.1/bin/elasticsearch -d"
sleep 6
# mongo-connector -m Element-mongodb:27017 -t Element-elasticsearch:9200 -d elastic2_doc_manager -a root -p ctguacm1234@
/bin/bash