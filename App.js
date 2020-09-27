import React from 'react';
import {SafeAreaView, Text, StatusBar, StyleSheet, Button} from 'react-native';

import useNativeCounter from './useNativeCounter';

const App = () => {
  const {counter, increment} = useNativeCounter();

  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView style={styles.container}>
        <Text style={styles.title}>Widget</Text>
        <Text style={styles.counter}>Counter value is {counter}</Text>
        <Button title="Increment counter" onPress={() => increment()} />
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
