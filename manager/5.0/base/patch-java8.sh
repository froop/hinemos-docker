#!/bin/bash -eu

sed -i 's/java version "1\.7\.0\.\*"/openjdk version "1.8.0.*"/' /opt/hinemos/bin/jvm_start.sh
sed -i 's/MaxTenuringThreshold=32/MaxTenuringThreshold=15/' /opt/hinemos/bin/jvm_start.sh
sed -i 's/1\.7\.0/1.8.0/' /opt/hinemos/etc/hinemos.cfg
