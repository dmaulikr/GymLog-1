const React = require('react-native');
const {
  StyleSheet,
  ListView,
  TouchableOpacity
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
    let onSelect = this.props.onAutofillSelect;
    console.log('On select: ' + onSelect);
    return (
      <ListView
        style={styles.container}
        dataSource={
          (new ListView.DataSource({rowHasChanged: (r1, r2) => false}))
            .cloneWithRows(suggestions)
        }
        renderRow={rowData => <TouchableOpacity onPress={(_) => onSelect(rowData.name)}>
                                      <DetailCell primaryText={rowData.name} detailText={`Last time: ${rowData.lastTime}`} />
                                    </TouchableOpacity>
                    }
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