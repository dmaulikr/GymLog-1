const React = require('react-native');
const {
  TouchableHighlight,
  Text,
  StyleSheet
} = React;

const NavigationButton = React.createClass({
  render() {
    return (
      <TouchableHighlight onPress={this.props.onPress}>
        <Text style={styles.backButton}>{'{'} {this.props.title}</Text>
      </TouchableHighlight>
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

export default NavigationButton