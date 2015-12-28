const React = require('react-native');
const {
  View,
  Text,
  StyleSheet
} = React;
import DetailCell from './detail-cell';
const Colors = require('../colors.json');
import NavigationBar from './navigation-bar';
import ListHeader from './list-header';
import WorkoutsSummary from './workouts-summary';
import AddButton from './add-button';

const Workout = React.NativeModules.Workout;

const WorkoutList = React.createClass({
  getInitialState() {
    return {
      workouts: [
      ]
    }
  },
  componentWillMount() {
    Workout.fetchAllWorkouts((error, workouts) => this.setState({ workouts: workouts }))
  },
  setWorkout(workout, index) {
    let newWorkouts = this.state.workouts.slice(0);  // https://davidwalsh.name/javascript-clone-array
    newWorkouts[index] = workout;
    this.setState({ workouts: newWorkouts });
  },
  render() {
    const transitionToWorkout = () => {
      Workout.registerNewWorkout((error, workout) => {
        let newWorkouts = this.state.workouts.slice(0);
        newWorkouts.unshift(workout);
        this.setState({ workouts: newWorkouts });
        this.props.navigator.push({ title: 'Workout', workout: workout, index: 0, setWorkout: this.setWorkout });
      });
    };
    const addButton = <AddButton onPress={transitionToWorkout} />;
    return (
      <View style={styles.container}>
        <NavigationBar title='Workouts' rightItem={addButton} />
        <WorkoutsSummary data={this.state.workouts} />
        <View style={styles.content}>
          {this.state.workouts.map(
            (d, index) => {
              const createdAt = new Date(d.createdAt * 1000);
              const month = createdAt.getMonth() + 1;
              const date = createdAt.getDate();
              const main = `${month}/${date}`;
              const hours = Math.floor(d.duration / 3600);
              const minutes = Math.floor((d.duration - hours * 3600) / 60);
              const detail = `${hours}h ${minutes}m • ${d.location}`;
              return <DetailCell primaryText={main} detailText={detail} key={index} />;
            })
          }
        </View>
      </View>
    )
  }
});

const styles = StyleSheet.create({
  container: {
  },
  content: {
    flex: 1
  }
});

export default WorkoutList;