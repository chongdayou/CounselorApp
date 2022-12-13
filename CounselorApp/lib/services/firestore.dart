import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helloworld/services/auth.dart';

class FirestoreServices {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    // /// Reads all documments from the topics collection
    // Future<List<Topic>> getTopics() async {
    //     var ref = db.collection('topics');
    //     var snapshot = await ref.get();
    //     var data = snapshot.docs.map((s) => s.data());
    //     var topics = data.map((d) => Topic.fromJson(d));
    //     return topics.toList();
    // }

    /// Listens to current user's report document in Firestore
    // Stream<Report> streamUserData() {
    //     return Auth().userStream.switchMap((user) {
    //     if (user != null) {
    //         var ref = db.collection('userData').doc(user.uid);
    //         return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
    //     } else {
    //         return Stream.fromIterable([Report()]);
    //     }
    //     });
    // }

    /// Updates the current user's report document after completing quiz
    // Future<void> updateUserData(Quiz quiz) {
    //     var user = Auth().user!;
    //     var ref = db.collection('userData').doc(user.uid);

    //     var data = {
    //     'total': FieldValue.increment(1),
    //     'topics': {
    //         quiz.topic: FieldValue.arrayUnion([quiz.id])
    //     }
    //     };

    //     return ref.set(data, SetOptions(merge: true));
    // }


}