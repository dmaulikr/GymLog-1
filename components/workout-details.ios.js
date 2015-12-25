const React = require('react-native');
const {
  View,
  Text,
  StyleSheet
} = React;
import Dimensions from 'Dimensions';
import NavigationBar from './navigation-bar';
import ListHeader from './list-header';
import StartWorkout from './start-workout';
import AddExerciseButton from './add-exercise-button';

const data = [];

const WorkoutDetails = React.createClass({
  render() {
    return (
      <View style={styles.container}>
        <NavigationBar title='12/23' />
        <View style={styles.content}>
          {data.length < 1 ? <StartWorkout /> : <ExercisesList exercises={data} />}
        </View>
        <View style={styles.footer}>
          <AddExerciseButton />
          {data.length >= 1 ? <FinishWorkoutButton /> : null}
        </View>
      </View>
    )
  }
});

const windowWidth = Dimensions.get('window').width;
const windowHeight = Dimensions.get('window').height;

const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  content: {
    flex: 1
  },
  footer: {
    bottom: 0,
    position: 'absolute',
    width: windowWidth
  }
});

export default WorkoutDetails;