FROM circleci/node:6.11.2
# Add the Cloud SDK distribution URI as a package source
RUN npm install -g mocha
RUN sudo apt-get install lsb-core
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# Import the Google Cloud Platform public key
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Update the package list and install the Cloud SDK
RUN sudo apt-get update && \
   sudo apt-get install -y google-cloud-sdk kubectl