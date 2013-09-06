#!/bin/sh

# Copy all the relevant flux stuff to a destination directory, so we can
# keep the software intact in an experimental directory.

src=`dirname $0`
dest="$1"

if [ ! -d "$dest" ] ; then
	echo "No such destination: $dest"
	exit 1
fi

cp $src/gtf_flux_fix.py $src/igenomes_setup.sh $dest
cp -r $src/flux-simulator $dest
