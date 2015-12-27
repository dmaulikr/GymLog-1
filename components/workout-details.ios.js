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

// const data = [
//   {
//     name: 'Bicep curl',
//     reps: [
//       {
//         count: 5,
//         weight: 70
//       },
//       {
//         count: 7,
//         weight: 60
//       },
//       {
//         count: 6,
//         weight: 60
//       },
//       {
//         count: 5,
//         weight: 60
//       },
//       {
//         count: 4,
//         weight: 60
//       }
//     ]
//   },
//   {
//     name: 'Squat',
//     reps: [
//       {
//         count: 3,
//         weight: 175
//       },
//       {
//         count: 2,
//         weight: 185
//       },
//       {
//         count: 5,
//         weight: 155
//       },
//       {
//         count: 5,
//         weight: 155
//       },
//       {
//         count: 5,
//         weight: 155
//       },
//       {
//         count: 5,
//         weight: 155
//       },
//       {
//         count: 5,
//         weight: 155
//       },
//       {
//         count: 7,
//         weight: 135
//       },
//     ]
//   }
// ];

const WorkoutDetails = React.createClass({
  render() {
    const transitionBack = () => this.props.navigator.pop();
    const backButton = <BackButton title='Workouts' onPress={transitionBack} />;
    const transitionToWorkout = () => 0;
    const editButton = <NavigationButton text='Edit' onPress={transitionToWorkout} />;

    const workout = this.props.workout;
    let workoutStart = workout.workoutStart || workout.createdAt;
    workoutStart = new Date(workoutStart * 1000);
    const title = `${workoutStart.getMonth() + 1}/${workoutStart.getDate()}`;

    const exercises = workout.exercises;

    let workoutTimes = 'Not started';
    if (workout.workoutStart) {
      const workoutStart = new Date(workout.workoutStart * 1000);
      if (workout.workoutEnd) {
        const workoutEnd = new Date(workout.workoutEnd * 1000);
        workoutTimes = `${workoutStart.getHours()}:${workoutStart.getMinutes()} – ${workoutEnd.getHours()}:${workoutEnd.getMinutes()}`;
      }
      else {
        workoutTimes = `Started ${workoutStart.getHours()}:${workoutStart.getMinutes()}`;
      }
    }
    return (
      <View style={styles.container}>
        <NavigationBar title={title} leftItem={backButton} rightItem={editButton} />
        <View style={styles.content}>
          <ListHeader>
            <View style={styles.workoutSummary}>
              <Text style={styles.workoutDate}>{title}</Text>
              <Text style={styles.workoutWhenWhere}>{workoutTimes} • {workout.location}</Text>
            </View>
          </ListHeader>
          {exercises.length < 1 ? <StartWorkout /> : <ExercisesList exercises={exercises} />}
        </View>
        <View style={styles.footer}>
          <AddExerciseButton onPress={() => this.props.navigator.push({title: 'AddExercise'})} />
          {exercises.length >= 1 ? <FinishWorkoutButton onPress={() => this.props.navigator.pop()} /> : null}
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