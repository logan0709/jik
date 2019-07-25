#!/bin/sh
#cluster.name='elasticsearch-cluster'
#discovery.zen.ping.unicast.hosts='elasticsearch-discovery'
#node.master='true'
#node.data='true'
es_opts=''
while IFS='=' read -r envvar_key envvar_value
do
  if [[ "$envvar_key" =~ ^[a-z0-9_]+\.[a-z0-9_]+ || "$envvar_key" == "processors" ]]; then
    if [[ ! -z $envvar_value ]]; then
      es_opt="-E${envvar_key}=${envvar_value}"
      es_opts+="${es_opt}"
    fi
  fi
done < <env
echo $es_opts