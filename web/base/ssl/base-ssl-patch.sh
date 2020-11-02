#!/bin/bash -eu

mv /tmp/patch/.keystore /opt/hinemos_web/
sed -i -z 's|<Connector port="80"[^>]*>||' /opt/hinemos_web/conf/server.xml
sed -i -z 's|<!--\(\s*<Connector port="443"[^>]*>\)\s*-->|\1|' /opt/hinemos_web/conf/server.xml

