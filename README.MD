# Ionic Android SDK Compiler

`docker run -it -v /path/to/your/app:/app --privileged kitar98/ionic-compiler bash`

Use `-v /tmp/gradle:/root/.gradle` for faster subsequent builds

## Test

`$ adb devices` - Allow devices

`$ ionic cordova run android` - Run on a connected device

## Compile

`$ ionic cordova build --release android` - Compile APK

The apk should be at: `/path/to/your/app/platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk`
