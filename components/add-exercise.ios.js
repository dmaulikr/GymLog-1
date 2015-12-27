const React = require('react-native');
const {
  TextInput,
  ListView,
  View,
  StyleSheet,
  Text
} = React;
const Colors = require('../colors.json');
import NavigationBar from './navigation-bar';
import AddRep from './add-rep';
import ExerciseSuggestions from './exercise-suggestions';
import RepEntry from './rep-entry';
import NavigationButton from './navigation-button';
// import ExerciseHistory from './exercise-history';

const reps = [
  {
    count: 5,
    weight: 70
  },
  {
    count: 6,
    weight: 60
  }
];

const AddExercise = React.createClass({
  render() {
    const transitionBack = () => this.props.navigator.pop();
    const backButton = <NavigationButton text='Cancel' onPress={transitionBack} />;
    const finishWorkout = () => 0;
    const finishButton = <NavigationButton text='Edit' onPress={finishWorkout} />;
    return (
      <View style={styles.container}>
        <NavigationBar title='12/23' leftItem={backButton} />
        <ListView
          style={styles.content}
          dataSource={
            (new ListView.DataSource({rowHasChanged: (r1, r2) => false}))
              .cloneWithRows([0, 1, 2, 3, 4, 5])
          }
          renderRow={(rowIndex) => {
            switch (rowIndex) {
              case 0:
                return (
                  <View style={styles.inputContainer}>
                    <TextInput
                      autoFocus={true}
                      placeholder='Exercise name'
                      enablesReturnKeyAutomatically={true}
                      style={styles.exerciseNameInput}
                      />
                  </View>
                )
              case 1:
                // return <ExerciseHistory />;
                return null;
              case 2:
                return <RepEntry count={reps[0].count} weight={reps[0].weight} />;
              case 3:
                return <RepEntry count={reps[1].count} weight={reps[1].weight} />;
              case 4:
                return <AddRep />;
              case 5:
                return (
                  <View style={styles.notesInputContainer}>
                    <TextInput
                      placeholder='Notes'
                      multiline={true}
                      style={styles.notesInput}
                    />
                  </View>
                )
            }
          }}
        />
      </View>
    )
  }
});

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column'
  },
  content: {
    flex: 1
  },
  exerciseNameInput: {
    fontSize: 30,
    fontWeight: '100',
    height: 60,
    padding: 10
  },
  inputContainer: {
    borderBottomColor: Colors.borderGrey,
    borderBottomWidth: 0.5,
  },
  notesInput: {
    flex: 1,
    height: 40,
    lineHeight: 20,
    padding: 10
  },
})

export default AddExercise;