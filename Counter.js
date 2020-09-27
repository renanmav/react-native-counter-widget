import {NativeModules, NativeEventEmitter} from 'react-native';

class Counter extends NativeEventEmitter {
  constructor(nativeModule) {
    super(nativeModule);

    this.value = nativeModule.value;

    this.increment = nativeModule.increment;
  }
}
export default new Counter(NativeModules.Counter);
