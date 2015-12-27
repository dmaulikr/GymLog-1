const React = require('react-native');
const {
  TouchableOpacity,
  Text,
  StyleSheet
} = React;

const NavigationButton = React.createClass({
  render() {
    return (
      <TouchableOpacity onPress={this.props.onPress}>
        <Text style={styles.navButton}>{this.props.text}</Text>
      </TouchableOpacity>
    )
  }
});

const styles = StyleSheet.create({
  navButton: {
    color: 'white',
    fontSize: 16,
    textAlign: 'center'
  }
});

export default NavigationButton