FROM ubuntu

MAINTAINER kitar98@live.com

WORKDIR /android

RUN apt update && apt install -y wget zip unzip curl git

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt install -y nodejs

RUN wget https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip \
        && unzip commandlinetools-linux-6609375_latest.zip \
        && rm -rf commandlinetools-linux-6609375_latest.zip \
        && mkdir cmdline-tools \
        && mv tools cmdline-tools

RUN apt install -y openjdk-8-jdk-headless openjdk-8-jre-headless gradle

RUN rm -rf /var/lib/apt/lists/*

ENV ANDROID_HOME="/android" \
    BUILD_TOOLS_VERSION="30.0.1" \
    PLATFORMS_VERSION="android-26"

ENV ANDROID_SDK_ROOT="${ANDROID_HOME}" \
    CMDLINE_TOOLS="${ANDROID_HOME}/cmdline-tools/tools/bin"

RUN yes | $CMDLINE_TOOLS/sdkmanager --licenses \
    && $CMDLINE_TOOLS/sdkmanager "tools" \
    && $CMDLINE_TOOLS/sdkmanager "build-tools;${BUILD_TOOLS_VERSION}" \
    && $CMDLINE_TOOLS/sdkmanager "platforms;${PLATFORMS_VERSION}" \
    && mkdir -p /root/.android/avd

ENV PATH="${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/emulator:${ANDROID_HOME}/build-tools/${BUILD_TOOLS_VERSION}"

RUN npm i -g cordova @ionic/cli native-run yarn

RUN cordova telemetry off

WORKDIR /app

CMD [ "bash" ]
