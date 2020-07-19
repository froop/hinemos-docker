#!/bin/bash -eu

docker save hinemos-manager-base-6.2.2 hinemos-web-base-6.2.2 hinemos-agent-base-6.2.2 > hinemos-images.tar
gzip hinemos-images.tar
