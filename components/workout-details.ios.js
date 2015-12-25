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
const Colors = require('../colors.json');

const data = [];

const WorkoutDetails = React.createClass({
  render() {
    return (
      <View style={styles.container}>
        <NavigationBar title='12/23' />
        <View style={styles.content}>
          <ListHeader>
            <View style={styles.workoutSummary}>
              <Text style={styles.workoutDate}>Yesterday</Text>
              <Text style={styles.workoutWhenWhere}>1:20 – 2:35 • Teagle</Text>
            </View>
          </ListHeader>
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
  },
  workoutDate: {
    fontSize: 24,
    fontWeight: '100',
    marginBottom: 6
  },
  workoutSummary: {
    marginLeft: 10,
    marginRight: 10
  },
  workoutWhenWhere: {
    color: Colors.darkGrey,
    fontSize: 13,
  }
});

export default WorkoutDetails;