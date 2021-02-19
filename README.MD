# Ionic Android SDK Compiler

`docker run -it -v /path/to/your/app:/app --privileged kitar98/ionic-compiler bash`

Use `-v /tmp/gradle:/root/.gradle` for faster subsequent builds

## Test

`$ adb devices` - Allow devices

`$ ionic cordova run android` - Run on a connected device