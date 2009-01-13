#!/bin/sh

# Clean up
rm -f ah09bProceedings.tar rm -f ah09bProceedings.tar.gz .gitrevision
# Get the revision SHA1 ID
git --no-pager log --pretty=oneline | awk '{print $1}' | head -1 > .gitrevision
# Create the archive using Git and add the revision ID file to the end
# of the archive:
git archive --format=tar --prefix=chep09tmva/ HEAD > ah09bProceedings.tar
cd ..
tar -rf ah09bProceedings/ah09bProceedings.tar ah09bProceedings/.gitrevision
cd ah09bProceedings
gzip ah09bProceedings.tar