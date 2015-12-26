const React = require('react-native');
const RNChart = require('react-native-chart');

const Colors = require('../colors.json');

const chartData = {
  name: 'LineChart',
  color: Colors.primaryColor,
  lineWidth: 2,
  showDataPoint: true,
  data: [42, 41, 43, 45, 50, 51, 54, 57, 59, 60]
};

const ExerciseHistory = React.createClass({
  render() {
    return (
      <View>
        <RNChart
          chartData={chartData}
          verticalGridStep="5"
        />
      </View>
    )
  }
});

export default ExerciseHistory;