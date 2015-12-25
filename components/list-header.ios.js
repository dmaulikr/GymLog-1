const React = require('react-native');
const {
  View,
  StyleSheet
} = React;
const Colors = require('../colors.json');

const ListHeader = React.createClass({
  render() {
    return (
      <View style={styles.listHeader}>
        {this.props.children}
      </View>
    )
  }
});

const styles = StyleSheet.create({
  listHeader: {
    backgroundColor: Colors.backgroundGrey,
    borderBottomColor: Colors.borderGrey,
    borderBottomWidth: 1,
    paddingBottom: 14,
    paddingTop: 14
  }
});

export default ListHeader;