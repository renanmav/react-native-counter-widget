import {useEffect, useState} from 'react';
import {NativeModules, NativeEventEmitter} from 'react-native';

class Counter extends NativeEventEmitter {
  constructor(nativeModule) {
    super(nativeModule);

    this.value = nativeModule.value;

    this.increment = nativeModule.increment;
  }
}

const nativeCounter = new Counter(NativeModules.Counter);

export default function useNativeCounter() {
  const [counter, setCounter] = useState(nativeCounter.value);

  useEffect(() => {
    const subscription = nativeCounter.addListener('onIncrement', ({value}) => {
      setCounter(value);
    });

    return () => nativeCounter.removeSubscription(subscription);
  }, []);

  return {
    counter,
    increment: nativeCounter.increment,
  };
}
