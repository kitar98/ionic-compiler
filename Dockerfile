FROM ubuntu

WORKDIR /android

RUN apt update && apt install -y wget zip unzip curl git

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash - && apt install -y nodejs

RUN wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip && \
    unzip *.zip && \
    rm -rf *.zip && \
    mkdir cmdline-tools && \
    mv tools cmdline-tools

RUN apt install -y openjdk-8-jdk-headless openjdk-8-jre-headless gradle

ENV ANDROID_HOME="/android"

ENV ANDROID_SDK_ROOT="${ANDROID_HOME}" \
    CMDLINE_TOOLS="${ANDROID_HOME}/cmdline-tools/tools/bin"

RUN yes | $CMDLINE_TOOLS/sdkmanager --licenses && \
    $CMDLINE_TOOLS/sdkmanager "tools" && \
    $CMDLINE_TOOLS/sdkmanager "build-tools;30.0.1" && \
    $CMDLINE_TOOLS/sdkmanager "platforms;android-26" && \
    mkdir -p /root/.android/avd

ENV PATH="${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/emulator:${ANDROID_HOME}/build-tools/30.0.1"

RUN npm i -g cordova @ionic/cli native-run yarn

WORKDIR /app

CMD [ "bash" ]
