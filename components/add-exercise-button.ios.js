const React = require('react-native');
const {
  View,
  Text,
  StyleSheet
} = React;
const Colors = require('../colors.json');

const AddExerciseButton = React.createClass({
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.primaryButton}>
          <Text style={styles.buttonPrompt}>+ Add exercise</Text>
        </View>
      </View>
    )
  }
});

const styles = StyleSheet.create({
  buttonPrompt: {
    color: 'white',
    fontSize: 14,
    textAlign: 'center'
  },
  container: {
    alignItems: 'stretch',
    flexDirection: 'row',
    padding: 10
  },
  primaryButton: {
    backgroundColor: Colors.primaryColor,
    borderRadius: 4,
    flex: 1,
    padding: 8,
    shadowColor: 'black',
    shadowOffset: {width: 0, height: 1},
    shadowOpacity: 0.3,
    shadowRadius: 1
  }
});

export default AddExerciseButton;