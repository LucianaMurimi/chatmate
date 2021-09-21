import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference therapists = FirebaseFirestore.instance.collection('therapists');

final Stream<QuerySnapshot> therapistsStream = therapists.snapshots();



Stream getSearchItems(itemToSearch){
  final Stream<QuerySnapshot> filteredResults = therapists.where('region', arrayContainsAny: [itemToSearch]).snapshots();

  return filteredResults;
}