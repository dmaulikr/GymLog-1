const React = require('react-native');
const {
  StyleSheet,
  Text,
  TouchableOpacity
} = React;
const Colors = require('../colors.json');

const FinishWorkoutButton = React.createClass({
  render() {
    return (
      <TouchableOpacity onPress={this.props.onPress}>
        <Text style={styles.finishWorkout}>Finish workout</Text>
      </TouchableOpacity>
    );
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