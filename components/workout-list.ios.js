const React = require('react-native');
const {
  View,
  Text,
  StyleSheet
} = React;
import DetailCell from './detail-cell';
const Colors = require('../colors.json');

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
        <View style={styles.navbar}>
          <Text style={styles.navbarTitle}>Workouts</Text>
        </View>
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
  },
  navbar: {
    backgroundColor: Colors.primaryColor,
    borderBottomColor: Colors.borderGrey,
    borderBottomWidth: 1,
    height: 64
  },
  navbarTitle: {
    color: 'white',
    flex: 1,
    fontSize: 17,
    fontWeight: 'bold',
    marginTop: 32,
    textAlign: 'center'
  }
});

export default WorkoutList;