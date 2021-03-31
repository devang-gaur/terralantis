FROM runatlantis/atlantis
ENV DEFAULT_TERRASCAN_VERSION=1.4.0
#ADD workflow.yaml ./workflow.yaml
RUN touch tfplan && mkdir -p /etc/atlantis/
ENV PLANFILE tfplan
ADD setup.sh ./setup.sh
ADD terrascan.sh ./terrascan.sh
ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x ./setup.sh ./terrascan.sh /usr/local/bin/docker-entrypoint.sh
RUN . ./setup.sh
ADD workflow.yaml /etc/atlantis/workflow.yaml

# copy docker entrypoint

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server"]