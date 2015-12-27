const React = require('react-native');
const {
  View,
  Text,
  StyleSheet
} = React;
const Colors = require('../colors.json');

const NavigationBar = React.createClass({
  render() {
    const rightItem = this.props.rightItem;
    return (
      <View style={styles.navbar}>
        <View style={styles.centerItem}>
          <Text style={styles.navbarTitle}>{this.props.title}</Text>
        </View>
        <View style={styles.rightItem}>
          {rightItem}
        </View>
      </View>
    )
  }
});

const styles = StyleSheet.create({
  centerItem: {
    left: 0,
    position: 'absolute',
    right: 0
  },
  navbar: {
    backgroundColor: Colors.primaryColor,
    borderBottomColor: Colors.borderGrey,
    borderBottomWidth: 1,
    height: 64
  },
  navbarTitle: {
    color: 'white',
    fontSize: 17,
    fontWeight: 'bold',
    marginTop: 32,
    textAlign: 'center'
  },
  rightItem: {
    bottom: 5,
    position: 'absolute',
    right: 10,
    width: 20
  }
});

export default NavigationBar;