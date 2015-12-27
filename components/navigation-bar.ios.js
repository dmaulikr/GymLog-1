const React = require('react-native');
const {
  View,
  Text,
  StyleSheet
} = React;
const Colors = require('../colors.json');

const NavigationBar = React.createClass({
  render() {
    console.log(`Left item: ${this.props.leftItem}, right item: ${this.props.rightItem}`);
    return (
      <View style={styles.navbar}>
        <View style={styles.leftItem}>
          {this.props.leftItem}
        </View>
        <View style={styles.centerItem}>
          <Text style={styles.navbarTitle}>{this.props.title}</Text>
        </View>
        <View style={styles.rightItem}>
          {this.props.rightItem}
        </View>
      </View>
    )
  }
});

const styles = StyleSheet.create({
  centerItem: {
    bottom: 10,
    left: 110,
    position: 'absolute',
    right: 110
  },
  leftItem: {
    bottom: 10,
    flexDirection: 'row',
    justifyContent: 'flex-start',
    left: 10,
    position: 'absolute',
    width: 100
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
    textAlign: 'center'
  },
  rightItem: {
    bottom: 5,
    flexDirection: 'row',
    justifyContent: 'flex-end',
    position: 'absolute',
    right: 10,
    width: 100
  }
});

export default NavigationBar;