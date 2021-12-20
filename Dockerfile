FROM docker.io/node:12.19.0-alpine3.12
RUN apk add --no-cache py3-pip jq bash git git-perl wget skopeo curl && pip3 install yq jsonschema
# Tools for publishing to surge.sh
RUN npm install --global surge && apk add --no-cache tree

USER 0
# Set permissions on /etc/passwd and /home to allow arbitrary users to write
COPY --chown=0:0 entrypoint.sh /
RUN mkdir -p /projects && \
    mkdir -p /home/user && \
    chgrp -R 0 /home && \
    chmod -R g=u /etc/passwd /etc/group /home && \
    chmod +x /entrypoint.sh
COPY bashrc /home/user/.bashrc

# Install common terminal editors in container to aid development process
COPY install-editor-tooling.sh /tmp
RUN chmod +x /tmp/install-editor-tooling.sh && /tmp/install-editor-tooling.sh && rm -f /tmp/install-editor-tooling.sh

USER 10001
ENV HOME=/home/user
WORKDIR /home/user
RUN wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash && \
    wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

WORKDIR /projects
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["tail", "-f", "/dev/null"]
