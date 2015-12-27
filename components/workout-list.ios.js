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

const WorkoutList = React.createClass({
  getInitialState() {
    return {
      data: [
        {
          main: '12/23 (Today)',
          duration: 8100,
          location: 'Teagle',
          detail: '2h 15m • Teagle'
        },
        {
          main: '12/22 (Yesterday)',
          duration: 7200,
          location: 'Teagle',
          detail: '2h 0m • Teagle'
        },
        {
          main: '12/21',
          duration: 7500,
          location: 'Noyes',
          detail: '2h 5m • Noyes'
        }
      ]
    }
  },
  render() {
    const transitionToWorkout = () => this.props.navigator.push({ title: 'Workout' });
    const addButton = <AddButton onPress={transitionToWorkout} />;
    return (
      <View style={styles.container}>
        <NavigationBar title='Workouts' rightItem={addButton} />
        <WorkoutsSummary data={this.state.data} />
        <View style={styles.content}>
          {this.state.data.map(
            (d, index) => {
              const hours = Math.floor(d.duration / 3600);
              const minutes = Math.floor((d.duration - hours * 3600) / 60);
              const detail = `${hours}h ${minutes}m • ${d.location}`;
              return <DetailCell primaryText={d.main} detailText={detail} key={index} />;
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