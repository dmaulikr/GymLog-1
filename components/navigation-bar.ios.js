const React = require('react-native');
const {
  View,
  Text,
  StyleSheet
} = React;
const Colors = require('../colors.json');

const NavigationBar = React.createClass({
  render() {
    return (
      <View style={styles.navbar}>
        <Text style={styles.navbarTitle}>{this.props.title}</Text>
      </View>
    )
  }
});

const styles = StyleSheet.create({
  navbar: {
    backgroundColor: Colors.primaryColor,
    borderBottomColor: Colors.borderGrey,
    borderBottomWidth: 1,
    height: 64
  },
  navbarTitle: {
    color: 'white',
    flex: 1,
    fontSize: 17,
    fontWeight: 'bold',
    marginTop: 32,
    textAlign: 'center'
  }
});

export default NavigationBar;