FROM runatlantis/atlantis
ENV DEFAULT_TERRASCAN_VERSION=1.4.0
#ADD workflow.yaml ./workflow.yaml
RUN touch tfplan && mkdir -p /etc/atlantis/
ENV PLANFILE tfplan
#TODO: revert back to using setup.sh rather than setup1.sh
ADD setup1.sh ./setup.sh
ADD terrascan.sh ./terrascan.sh
ADD atlantis-entrypoint.sh /usr/local/bin/atlantis-entrypoint.sh
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x ./setup.sh ./terrascan.sh /usr/local/bin/atlantis-entrypoint.sh /usr/local/bin/entrypoint.sh
RUN . ./setup.sh
ADD workflow.yaml /etc/atlantis/workflow.yaml
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
CMD ["server"]