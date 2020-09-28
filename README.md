# react-native-counter-widget

Simple counter app with iOS 14 widget build with React Native and Swift.

<p align="center">

<img src="./img/preview.gif" />

</p>

My motivation to create this repository is to check how hard it is to add iOS widgets to existing React Native apps.
It turns out that is not that difficult, you just need some knowledge on [Native Modules for iOS](https://reactnative.dev/docs/native-modules-ios#exporting-swift) and [Swift programming](https://swift.org/documentation/).

# Most important pieces of work

- First we have a NativeModule called [Counter](https://github.com/renanmav/react-native-counter-widget/blob/master/ios/Widget/Counter.swift) that is responsable for keep tracking of the counter value and update the widget at the right time.
- Then we map this NativeModule to a hook called [useNativeCounter](https://github.com/renanmav/react-native-counter-widget/blob/master/useNativeCounter.js) that pulls the counter value into a React state and adds an event listener

# How to create widgets

If you are curious:

1. Open the xcworkspace of your React Native project in XCode
2. Create some Swift file, XCode will ask you if you want to create the bridging header. Click on "yes".
3. Create a new target under "File" > "New" > "Target..." and select "Widget Extension"
4. If you try to build your app right now it will fail. Delete every Swift 5.0 reference under `LIBRARY_SEARCH_PATHS` will solve your problem as [mentioned here](https://github.com/react-native-community/upgrade-support/issues/62#issuecomment-622985723).
5. Implement the logic for your widget

# Reference 

- https://reactnative.dev/docs/native-modules-ios
- https://teabreak.e-spres-oh.com/swift-in-react-native-the-ultimate-guide-part-1-modules-9bb8d054db03#f662
- https://developer.apple.com/documentation/widgetkit/
