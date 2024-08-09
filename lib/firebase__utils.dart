import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/task.dart';

class FirebaseUtils{

  static CollectionReference<Task> getTasksCollection(){
    return FirebaseFirestore.instance.collection(Task.collectionName).
    withConverter<Task>(
        fromFirestore: ((snapshot, options) => Task.fromFireStore(snapshot.data()!)),

        toFirestore: (task,options) => task.ToFirestore()
    );

  }
  static Future<void> addTaskToFirebase(Task task){
    var taskCollectionRef = getTasksCollection();
    DocumentReference<Task> taskDocRef = taskCollectionRef.doc();
    task.id = taskDocRef.id;
    return taskDocRef.set(task);


  }
  static Future<void> deleteTaskFromFireStore(String id ){
    return getTasksCollection().doc(id).delete();
  }
}