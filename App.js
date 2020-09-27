import React, {useState, useEffect} from 'react';
import {SafeAreaView, Text, StatusBar, StyleSheet, Button} from 'react-native';

import Counter from './Counter';

const App = () => {
  const [counter, setCounter] = useState(Counter.value);

  useEffect(() => {
    const subscription = Counter.addListener('onIncrement', ({value}) => {
      setCounter(value);
    });

    return () => Counter.removeSubscription(subscription);
  }, []);

  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView style={styles.container}>
        <Text style={styles.title}>Widget</Text>
        <Text style={styles.counter}>Counter value is {counter}</Text>
        <Button title="Increment counter" onPress={() => Counter.increment()} />
      </SafeAreaView>
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  title: {
    fontSize: 30,
    fontWeight: 'bold',
  },
  counter: {
    fontSize: 20,
    marginVertical: 20,
  },
});

export default App;
