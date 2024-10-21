class getData {
  String? serialNumber;
  bool? qr1_completed;
  String? qr1_completed_time;

  getData({
    this.serialNumber,
    this.qr1_completed,
    this.qr1_completed_time,
  });

  factory getData.fromJson(Map<String, dynamic> json) {
    return getData(
        serialNumber: json['serial_number'],
        qr1_completed: json['qr1_completed'],
        qr1_completed_time: json['qr1_completed_time']);
  }
}
