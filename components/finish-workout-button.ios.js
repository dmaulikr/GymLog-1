const React = require('react-native');
const {
  StyleSheet,
  Text
} = React;
const Colors = require('../colors.json');

const FinishWorkoutButton = React.createClass({
  render() {
    return <Text style={styles.finishWorkout}>Finish workout</Text>
  }
});

const styles = StyleSheet.create({
  finishWorkout: {
    color: Colors.primaryColor,
    marginBottom: 20,
    marginTop: 10,
    textAlign: 'center'
  }
});

export default FinishWorkoutButton;