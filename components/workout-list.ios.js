const React = require('react-native');
const {
  View,
  Text,
  StyleSheet
} = React;
import DetailCell from './detail-cell';
const Colors = require('../colors.json');
import NavigationBar from './navigation-bar';

const data = [
  {
    main: '12/23 (Today)',
    detail: '2h 15m • Teagle'
  },
  {
    main: '12/22 (Yesterday)',
    detail: '2h 0m • Teagle'
  },
  {
    main: '12/21',
    detail: '2h 5m • Noyes'
  }
];

const WorkoutList = React.createClass({
  render() {
    return (
      <View style={styles.container}>
        <NavigationBar title='Workouts' />
        <View style={styles.content}>
          {data.map((d, index) => <DetailCell primaryText={d.main} detailText={d.detail} key={index} />)}
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