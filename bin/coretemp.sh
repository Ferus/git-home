#!/bin/sh
#
# Print average temperature of all CPU cores.
#
# by Paul Merrill
#

if [ `uname` != "Linux" ]; then
	echo "Only works on Linux. :("
	exit 1
fi

if ! hash sensors 2>&-; then
	echo "Requires lm-sensors or lm_sensors package."
	exit 1
fi

sensors | awk '
BEGIN {
	sum = 0;
	count = 0;
}

$1 == "Core" {
	sum += int($3);
	count++;
}

END {
	if (count > 0) {
		print sum / count " °C";
	}
	else {
		print "CPU core temperatures not found."
		print "(Try running sensors-detect?)";
		exit 1
	}
}
'

