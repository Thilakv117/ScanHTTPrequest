class Project {
  String? serialNumber;
  bool? qr1Completed;
  String? qr1CompletedTime;
  bool? qr2Completed;
  String? qr2CompletedTime;
  bool? qr3Completed;
  String? qr3CompletedTime;

  Project(
      {this.serialNumber,
      this.qr1Completed,
      this.qr1CompletedTime,
      this.qr2Completed,
      this.qr2CompletedTime,
      this.qr3Completed,
      this.qr3CompletedTime});

  Project.fromJson(Map<String, dynamic> json) {
    serialNumber = json['serial_number'];
    qr1Completed = json['qr1_completed'];
    qr1CompletedTime = json['qr1_completed_time'];
    qr2Completed = json['qr2_completed'];
    qr2CompletedTime = json['qr2_completed_time'];
    qr3Completed = json['qr3_completed'];
    qr3CompletedTime = json['qr3_completed_time'];
  }

  
}