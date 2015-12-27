const React = require('react-native');
const {
  TouchableOpacity,
  Text,
  StyleSheet
} = React;

const AddButton = React.createClass({
  render() {
    return (
      <TouchableOpacity onPress={this.props.onPress}>
        <Text style={styles.addButton}>+</Text>
      </TouchableOpacity>
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