#!/bin/sh
#

# If command starts with an option, prepend storo.
if [ "${1}" != "storo" ]; then
	if [ -n "${1}" ]; then
		set -- storo "$@"
	fi
fi

exec "$@"
