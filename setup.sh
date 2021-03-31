if [[ -z "${TERRASCAN_VERSION}" ]]; then
  TERRASCAN_VERSION=${DEFAULT_TERRASCAN_VERSION}
fi

VERSION=${TERRASCAN_VERSION}

curl -LOs https://github.com/accurics/terrascan/releases/download/v${VERSION}/terrascan_${VERSION}_Linux_x86_64.tar.gz
mkdir /usr/local/bin/terrascan_${VERSION}
tar -C  /usr/local/bin/terrascan_${VERSION} -xzf terrascan_${VERSION}_Linux_x86_64.tar.gz

mv /usr/local/bin/terrascan_${VERSION}/terrascan /usr/local/bin/terrascan

rm terrascan_${VERSION}_Linux_x86_64.tar.gz
rm -rf /usr/local/bin/terrascan_${VERSION}/