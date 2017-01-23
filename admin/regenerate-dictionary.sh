#!/bin/bash

pushd `dirname $0`
./init-ncbo-cron.sh
printf "\e[1m Re-generating dictionary... \e[0m \n"
ssh root@localhost -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null -p 2222 "cd /srv/ncbo/ncbo_cron/ && echo 'yes' | ruby -EUTF-8 ./bin/ncbo_ontology_annotate_generate_dictionary -l logs/dictionary-gen.log" 2>/dev/null

docker-compose restart bioportal-mgrep
popd
