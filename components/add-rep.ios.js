const React = require('react-native');
const {
  View,
  Text,
  TextInput,
  StyleSheet,
  TouchableOpacity
} = React;
const Colors = require('../colors.json');

const Exercise = React.NativeModules.Exercise;

const AddRep = React.createClass({
  getInitialState() {
    return {
      reps: '',
      weight: ''
    }
  },
  render() {
    var submitButton;
    if (this.state.reps.length < 1 || this.state.weight.length < 1)
      submitButton = <Text style={styles.disabledAddRepButton}>Add</Text>
    else {
      const submit = () => {
        Exercise.addSet(
          {
            repCount: parseInt(this.state.reps, 10), 
            weight: parseInt(this.state.weight)
          }, this.props.exercise, (error, set, exercise) => {
            console.log('Got exercise: ' + JSON.stringify(exercise));
            this.props.setExercise(exercise, this.props.index);
          }
        );
      }
      submitButton = (
        <TouchableOpacity style={styles.repButtonPosition} onPress={submit}>
          <Text style={styles.addRepButton}>Add</Text>
        </TouchableOpacity>
      );
    }

    return (
      <View style={styles.container}>
        <View style={styles.inputContainer}>
          <TextInput
            placeholder='Reps'
            keyboardType='number-pad'
            style={styles.repsInput}
            value={this.state.reps}
            onChangeText={text => this.setState({ reps: text })}
            />
        </View>
        <Text style={styles.repsAt}> @ </Text>
        <View style={styles.inputContainer}>
          <TextInput
            placeholder='Weight'
            keyboardType='number-pad'
            style={styles.repsInput}
            value={this.state.weight}
            onChangeText={text => this.setState({ weight: text })}
            />
        </View>
        {submitButton}
      </View>
    )
  }
});

const styles = StyleSheet.create({
  addRepButton: {
    color: Colors.primaryColor,
    lineHeight: 20
  },
  container: {
    alignItems: 'center',
    borderBottomColor: Colors.borderGrey,
    borderBottomWidth: 0.5,
    flexDirection: 'row',
    height: 44,
    padding: 10
  },
  disabledAddRepButton: {
    color: Colors.primaryColor,
    lineHeight: 20,
    opacity: 0.75,
    position: 'absolute',
    right: 10
  },
  inputContainer: {
    borderBottomColor: Colors.darkGrey,
    borderBottomWidth: 0.5
  },
  repButtonPosition: {
    position: 'absolute',
    right: 10
  },
  repsInput: {
    fontSize: 14,
    height: 18,
    width: 50
  }
});

export default AddRep;