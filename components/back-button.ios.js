const React = require('react-native');
const {
  TouchableOpacity,
  Text,
  StyleSheet
} = React;

const BackButton = React.createClass({
  render() {
    return (
      <TouchableOpacity onPress={this.props.onPress}>
        <Text style={styles.backButton}>{'{'} {this.props.title}</Text>
      </TouchableOpacity>
    )
  }
});

const styles = StyleSheet.create({
  backButton: {
    color: 'white',
    fontSize: 16,
    // fontWeight: '300',
    textAlign: 'center'
  }
});

export default BackButton;