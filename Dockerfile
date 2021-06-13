FROM codercom/code-server:latest
USER root
RUN curl -Lo /usr/local/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&\
    chmod 777 /usr/local/bin/kubectl &&\
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash &&\
    apt update -y &&\
    apt install -y ansible-lint
USER 1000
RUN code-server --install-extension ms-python.python &&\
    code-server --install-extension ms-azuretools.vscode-docker &&\
    code-server --install-extension redhat.vscode-yaml &&\
    code-server --install-extension ms-kubernetes-tools.vscode-kubernetes-tools

