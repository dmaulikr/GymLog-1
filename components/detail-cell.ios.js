const React = require('react-native');
const {
  StyleSheet,
  Text,
  View
} = React;
const Colors = require('../colors.json');

const DetailCell = React.createClass({
  render() {
    let detailView = null;
    if (this.props.detailText) {
      detailView = (
        <View style={styles.label}>
          <Text style={styles.detailLabel}>
            {this.props.detailText}
          </Text>
        </View>
      )
    }
    else if (this.props.detailView) {
      detailView = (
        <View style={styles.label}>
          {this.props.detailView}
        </View>
      )
    }
    return (
      <View style={styles.cell}>
        <View style={styles.label}>
          <Text style={styles.primaryLabel}>
            {this.props.primaryText}
          </Text>
        </View>
        {detailView}
      </View>
    )
  }
});

const styles = StyleSheet.create({
  cell: {
    borderBottomColor: Colors.borderGrey,
    borderBottomWidth: 0.5,
    padding: 16
  },
  detailLabel: {
    color: Colors.darkGrey,
    fontSize: 12
  },
  primaryLabel: {
    fontWeight: 'bold',
    marginBottom: 8
  }
});

export default DetailCell;