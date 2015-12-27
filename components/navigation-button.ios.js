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
        <Text style={styles.navButton}>{this.props.text}</Text>
      </TouchableHighlight>
    )
  }
});

const styles = StyleSheet.create({
  navButton: {
    color: 'white',
    fontSize: 30,
    fontWeight: '500',
    textAlign: 'center'
  }
});

export default NavigationButton