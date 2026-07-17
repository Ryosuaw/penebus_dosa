import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> addTraffic(
    int rx,
    int tx,
  ) async {
    await _firestore.collection('traffic').add({
      'rx': rx,
      'tx': tx,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> streamTraffic() {
    return _firestore
        .collection('traffic')
        .orderBy(
          'timestamp',
          descending: false,
        )
        .snapshots();
  }

  Future<void> generateTraffic() async {
    final random = Random();

    int rx = random.nextInt(500) + 50;
    int tx = random.nextInt(500) + 50;

    await addTraffic(rx, tx);
  }
}