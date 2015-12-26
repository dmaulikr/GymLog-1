const React = require('react-native');
const {
  StyleSheet,
  ListView
} = React;
const Colors = require('../colors.json');
import DetailCell from './detail-cell';

const suggestions = [
  {
    name: 'Bench press',
    lastTime: '3 days ago'
  },
  {
    name: 'Bicep curl',
    lastTime: 'Yesterday'
  }
];

const ExerciseSuggestions = React.createClass({
  render() {
    return (
      <ListView
        style={styles.container}
        dataSource={
          (new ListView.DataSource({rowHasChanged: (r1, r2) => false}))
            .cloneWithRows(suggestions)
        }
        renderRow={rowData => <DetailCell primaryText={rowData.name} detailText={`Last time: ${rowData.lastTime}`} />}
      />
    )
  }
});

const styles = StyleSheet.create({
  container: {
    backgroundColor: Colors.backgroundGrey,
    borderTopColor: '#AAA',
    borderTopWidth: 1,
    flex: 1
  }
});

export default ExerciseSuggestions;