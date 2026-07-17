class TrafficModel {
  final int rx;
  final int tx;
  final DateTime timestamp;

  TrafficModel({
    required this.rx,
    required this.tx,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'rx': rx,
      'tx': tx,
      'timestamp': timestamp,
    };
  }

  factory TrafficModel.fromMap(Map<String, dynamic> map) {
    return TrafficModel(
      rx: map['rx'] ?? 0,
      tx: map['tx'] ?? 0,
      timestamp: map['timestamp'].toDate(),
    );
  }
}