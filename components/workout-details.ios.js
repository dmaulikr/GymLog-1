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
import ExercisesList from './exercises-list';
import FinishWorkoutButton from './finish-workout-button';
import NavigationButton from './navigation-button';
import BackButton from './back-button';
const Colors = require('../colors.json');

const data = [
  {
    name: 'Bicep curl',
    reps: [
      {
        count: 5,
        weight: 70
      },
      {
        count: 7,
        weight: 60
      },
      {
        count: 6,
        weight: 60
      },
      {
        count: 5,
        weight: 60
      },
      {
        count: 4,
        weight: 60
      }
    ]
  },
  {
    name: 'Squat',
    reps: [
      {
        count: 3,
        weight: 175
      },
      {
        count: 2,
        weight: 185
      },
      {
        count: 5,
        weight: 155
      },
      {
        count: 5,
        weight: 155
      },
      {
        count: 5,
        weight: 155
      },
      {
        count: 5,
        weight: 155
      },
      {
        count: 5,
        weight: 155
      },
      {
        count: 7,
        weight: 135
      },
    ]
  }
];

const WorkoutDetails = React.createClass({
  render() {
    const transitionBack = () => this.props.navigator.pop();
    const backButton = <BackButton title='Workouts' onPress={transitionBack} />;
    const transitionToWorkout = () => 0;
    const addButton = <NavigationButton text='Edit' onPress={transitionToWorkout} />;
    return (
      <View style={styles.container}>
        <NavigationBar title='12/23' leftItem={backButton} rightItem={addButton} />
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
          <AddExerciseButton onPress={() => this.props.navigator.push({title: 'AddExercise'})} />
          {data.length >= 1 ? <FinishWorkoutButton onPress={() => this.props.navigator.pop()} /> : null}
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