const React = require('react-native');
const {
  ListView,
  View,
  Text,
  StyleSheet
} = React;
import DetailCell from './detail-cell';
const Colors = require('../colors.json');

const arrayInterleave = (source, joiner) => {
  const resultLength = source.length * 2 - 1;
  let result = new Array(resultLength);
  for (var i = 0; i < resultLength; i++)
    if (i % 2 === 0)
      result[i] = source[Math.floor(i / 2)];
    else
      if (typeof joiner === 'function')
        result[i] = joiner(i);
      else
        result[i] = joiner;
  return result;
};

const ExercisesList = React.createClass({
  render() {
    return (
      <ListView
        dataSource={
          (new ListView.DataSource({rowHasChanged: (r1, r2) => false}))
            .cloneWithRows(this.props.exercises)
        }
        renderRow={rowData => {
          const sortedWeights = rowData.reps.map(rep => rep.weight).sort();
          const maxWeight = sortedWeights[sortedWeights.length - 1];
          let repsText = rowData.reps.map((rep, index) => {
            let textStyle = styles.repText;
            if (rep.weight === maxWeight)
              textStyle = styles.maxRepText;
            return (
              <Text style={textStyle} key={index}>
                {rep.count}@{rep.weight}
              </Text>
            );
          });
          let repsView = (
            <View style={styles.repsView}>
              {arrayInterleave(
                repsText, 
                (index) => 
                  <Text key={repsText.length + index} style={styles.repText}> | </Text>
                )
              }
            </View>
          );
          return <DetailCell primaryText={rowData.name} detailView={repsView} />;
        }}
      />
    )
  }
});

const styles = StyleSheet.create({
  maxRepText: {
    color: Colors.darkGrey,
    fontSize: 12,
    fontWeight: 'bold',
    lineHeight: 20
  },
  repsView: {
    flexDirection: 'row',
    flexWrap: 'wrap'
  },
  repText: {
    color: Colors.darkGrey,
    fontSize: 12,
    lineHeight: 20
  }
});

export default ExercisesList;