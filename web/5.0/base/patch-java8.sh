#!/bin/bash -eu

sed -i 's/1\.7\.0/1.8.0/' /opt/hinemos_web/hinemos_web.cfg
sed -i 's/java version "1\.7\.0\.\*"/openjdk version "1.8.0.*"/' /opt/hinemos_web/bin/tomcat_start.sh
sed -i 's/MaxTenuringThreshold=32/MaxTenuringThreshold=15/' /opt/hinemos_web/bin/tomcat_start.sh
