const React = require('react-native');
const {
  StyleSheet,
  Text,
  View
} = React;
const Colors = require('../colors.json');

const RepEntry = React.createClass({
  render() {
    return (
      <View style={styles.container}>
        <Text>{this.props.count} @ {this.props.weight}</Text>
      </View>
    )
  }
});

const styles = StyleSheet.create({
  container: {
    borderBottomColor: Colors.borderGrey,
    borderBottomWidth: 0.5,
    paddingBottom: 14,
    paddingLeft: 10,
    paddingRight: 10,
    paddingTop: 14
  },
});

export default RepEntry;