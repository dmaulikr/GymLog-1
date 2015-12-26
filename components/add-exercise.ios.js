const React = require('react-native');
const {
  TextInput,
  View,
  StyleSheet
} = React;
const Colors = require('../colors.json');
import NavigationBar from './navigation-bar';
import AddRep from './add-rep';

const AddExercise = React.createClass({
  render() {
    return (
      <View style={styles.container}>
        <NavigationBar title='12/23' />
        <View style={styles.inputContainer}>
          <TextInput
            autoFocus={true}
            placeholder='Exercise name'
            enablesReturnKeyAutomatically={true}
            style={styles.exerciseNameInput}
            />
        </View>
        <AddRep />  
      </View>
    )
  }
});

const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  exerciseNameInput: {
    fontSize: 30,
    fontWeight: '100',
    height: 60,
    padding: 10
  },
  inputContainer: {
    borderBottomColor: Colors.borderGrey,
    borderBottomWidth: 0.5,
  }
})

export default AddExercise;