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

const AddExercise = React.createClass({
  getInitialState() {
    return {
      uid: 0,
      name: '',
      notes: '',
      sets: []
    }
  },
  componentWillMount() {
    const exercise = this.props.exercise;
    this.setExercise(exercise);
  },
  setExercise(exercise, index) {
    this.setState({
      uid: exercise.uid,
      name: exercise.name,
      notes: exercise.notes,
      sets: exercise.sets
    });
    console.log('New sets: ' + JSON.stringify(exercise.sets));
    this.props.setExercise(exercise, index);
  },
  render() {
    const transitionBack = () => this.props.navigator.pop();
    const backButton = <NavigationButton text='Cancel' onPress={transitionBack} />;

    const finishWorkout = () => this.props.navigator.pop();
    let finishEnabled = true;
    if (this.state.name.length < 1)
      finishEnabled = false;
    if (this.state.sets.length < 1)
      finishEnabled = false;
    const finishButton = <NavigationButton text='Finish' onPress={finishWorkout} disabled={!finishEnabled} />;

    const arrayWithLength = (length) => {
      let array = [];
      for (var i = length - 1; i >= 0; i--)
        array[i] = i;
      console.log(`Length: ${length}, array: ${JSON.stringify(array)}`);
      return array;
    };
    const exercise = this.state;
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
                    value={this.state.name}
                    onChangeText={(text) => this.setState({ name: text })}
                    />
                </View>
              );
            else if (rowIndex === exercise.sets.length + 1)
              return <AddRep exercise={exercise} setExercise={this.setExercise} index={this.props.index} />;
            else if (rowIndex === exercise.sets.length + 2)
              return (
                <View style={styles.notesInputContainer}>
                  <TextInput
                    placeholder='Notes'
                    multiline={true}
                    style={styles.notesInput}
                    value={this.state.notes}
                    onChangeText={(text) => this.setState({ notes: text })}
                  />
                </View>
              );
            else {
              const setIndex = rowIndex - 1;
              console.log(`Set index: ${setIndex}, set: ${JSON.stringify(exercise.sets[setIndex])}`);
              const set = exercise.sets[setIndex];
              return <RepEntry count={set.repCount} weight={set.weight} />;
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