#!/bin/bash -eu

sed -i 's/java version "1\.\[6|7\]\.0\.\*"/[java|openjdk] version "1.[6|7|8].0.*"/' /opt/hinemos_agent/bin/agent_start.sh
sed -i 's/MaxTenuringThreshold=32/MaxTenuringThreshold=15/' /opt/hinemos_agent/bin/agent_start.sh
