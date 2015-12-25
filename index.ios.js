/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  Navigator,
  StyleSheet,
  Text,
  View
} = React;
import WorkoutList from './components/workout-list';
const Colors = require('./colors.json');

var GymLog = React.createClass({
  getInitialState: function() {
    return {
      currentRoute: { title: 'Workouts' }
    }
  },
  render: function() {
    return (
      <Navigator
        initialRoute={this.state.currentRoute}   
        renderScene={(route, navigator) => <WorkoutList />}
        />
    );
  }
});

AppRegistry.registerComponent('GymLog', () => GymLog);
