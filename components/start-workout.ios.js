const React = require('react-native');
const {
  View,
  Text,
  Image,
  StyleSheet
} = React;
const Colors = require('../colors.json');

const StartWorkout = React.createClass({
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.content}>
          <View style={styles.imageContainer}>
            <Image 
              style={styles.startImage} 
              source={require('../assets/startImage.png')} 
              />
            </View>
          <Text style={styles.readyPrompt}>Ready to start?</Text>
        </View>
      </View>
    );
  }
});

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'center',
  },
  content: {
    alignItems: 'stretch',
    flexDirection: 'column',
    height: 162,
  },
  imageContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
    marginBottom: 10
  },
  readyPrompt: {
    color: Colors.darkGrey,
    fontWeight: 'bold',
    textAlign: 'center'
  },
  startImage: {
    height: 132,
    width: 160
  }
});

export default StartWorkout;