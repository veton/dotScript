FROM microsoft/dotnet:2.0.3-sdk-jessie

# Install Common packages
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    apt-utils \
    apt-transport-https \
    lsb-release \
    ca-certificates \
    gnupg2 \
    libicu52 \
    libssl1.0.0 \
    git

# Install Mictrosoft packages
RUN curl https://packages.microsoft.com/keys/microsoft.asc | \
    apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | \
    tee /etc/apt/sources.list.d/microsoft.list
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    powershell \
    nuget

# Install NPM & modules
RUN curl -sL https://deb.nodesource.com/setup_8.x | \
    bash -
# https://github.com/npm/npm/issues/15558
RUN apt-get install -y --no-install-recommends nodejs && \
    npm install -g npm@5.6.0
RUN npm install -g typescript
