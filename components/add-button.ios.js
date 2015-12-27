const React = require('react-native');
const {
  TouchableHighlight,
  Text,
  StyleSheet
} = React;

const AddButton = React.createClass({
  render() {
    return (
      <TouchableHighlight onPress={this.props.onPress}>
        <Text style={styles.addButton}>+</Text>
      </TouchableHighlight>
    )
  }
});

const styles = StyleSheet.create({
  addButton: {
    color: 'white',
    fontSize: 30,
    fontWeight: '500',
    marginBottom: -7,
    textAlign: 'center'
  }
});

export default AddButton;