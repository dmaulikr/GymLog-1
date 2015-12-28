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
    const finishWorkout = () => this.props.navigator.pop();
    const finishButton = <NavigationButton text='Finish' onPress={finishWorkout} />;

    const arrayWithLength = (length) => {
      let array = [];
      for (var i = length - 1; i >= 0; i--)
        array[i] = i;
      return array;
    };
    const exercise = this.props.exercise;
    return (
      <View style={styles.container}>
        <NavigationBar title='12/23' leftItem={backButton} rightItem={finishButton} />
        <ListView
          style={styles.content}
          dataSource={
            (new ListView.DataSource({rowHasChanged: (r1, r2) => false}))
              .cloneWithRows(arrayWithLength(exercise.sets.length + 3))
          }
          renderRow={(rowIndex) => {
            if (rowIndex === 0)
              return (
                <View style={styles.inputContainer}>
                  <TextInput
                    autoFocus={true}
                    placeholder='Exercise name'
                    enablesReturnKeyAutomatically={true}
                    style={styles.exerciseNameInput}
                    />
                </View>
              );
            else if (rowIndex === exercise.sets.length + 1)
              return <AddRep />;
            else if (rowIndex === exercise.sets.length + 2)
              return (
                <View style={styles.notesInputContainer}>
                  <TextInput
                    placeholder='Notes'
                    multiline={true}
                    style={styles.notesInput}
                  />
                </View>
              );
            else {
              const setIndex = rowIndex - 1;
              const set = exercise.sets[setIndex];
              return <RepEntry count={set.count} weight={set.weight} />;
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