const React = require('react-native');
const {
  View,
  Text,
  TextInput,
  StyleSheet
} = React;
const Colors = require('../colors.json');

const AddRep = React.createClass({
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.inputContainer}>
          <TextInput
            placeholder='Reps'
            keyboardType='number-pad'
            style={styles.repsInput}
            />
        </View>
        <Text style={styles.repsAt}> @ </Text>
        <View style={styles.inputContainer}>
          <TextInput
            placeholder='Weight'
            keyboardType='number-pad'
            style={styles.repsInput}
            />
        </View>
        <Text style={styles.addRepButton}>Add</Text>
      </View>
    )
  }
});

const styles = StyleSheet.create({
  container: {
    alignItems: 'center',
    borderBottomColor: Colors.borderGrey,
    borderBottomWidth: 0.5,
    flexDirection: 'row',
    height: 44,
    padding: 10
  },
  inputContainer: {
    borderBottomColor: Colors.darkGrey,
    borderBottomWidth: 0.5
  },
  repsInput: {
    fontSize: 14,
    height: 18,
    width: 50
  },
  addRepButton: {
    color: Colors.primaryColor,
    lineHeight: 20,
    position: 'absolute',
    right: 10
  }
});

export default AddRep;