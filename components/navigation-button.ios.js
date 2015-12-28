const React = require('react-native');
const {
  TouchableOpacity,
  Text,
  StyleSheet
} = React;

const NavigationButton = React.createClass({
  render() {
    if (this.props.disabled) 
      return <Text style={styles.disabledNavButton}>{this.props.text}</Text>;
    else
      return (
        <TouchableOpacity onPress={this.props.onPress}>
          <Text style={styles.navButton}>{this.props.text}</Text>
        </TouchableOpacity>
      );
  }
});

const styles = StyleSheet.create({
  disabledNavButton: {
    color: 'white',
    fontSize: 16,
    opacity: 0.75,
    textAlign: 'center'
  },
  navButton: {
    color: 'white',
    fontSize: 16,
    textAlign: 'center'
  }
});

export default NavigationButton