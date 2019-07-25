#!/bin/sh
set -e

# Files created by Elasticsearch should always be group writable too
umask 0002

run_as_other_user_if_needed() {
  if [[ "$(id -u)" == "0" ]]; then
    # If running as root, drop to specified UID and run command
    exec chroot --userspec=1000 / "${@}"
  else
    # Either we are running in Openshift with random uid and are a member of the root group
    # or with a custom --user
    exec "${@}"
  fi
}

es_opts=''

while IFS='=' read -r envvar_key envvar_value
do
  # Elasticsearch settings need to have at least two dot separated lowercase
  # words, e.g. `cluster.name`, except for `processors` which we handle
  # specially
  if [[ "$envvar_key" =~ ^[a-z0-9_]+\.[a-z0-9_]+ || "$envvar_key" == "processors" ]]; then
    if [[ ! -z $envvar_value ]]; then
      es_opt="-E${envvar_key}=${envvar_value}"
      es_opts="${es_opts} ${es_opt}"
    fi
  fi
done

echo $es_opts

export ES_JAVA_OPTS="-Des.cgroups.hierarchy.override=/ $ES_JAVA_OPTS"

run_as_other_user_if_needed /usr/share/elasticsearch-$ES_VERSION/bin/elasticsearch "${es_opts}"
