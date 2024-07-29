class BloodRequestModel {
  final int? id;
  final String bloodType;
  final int quantity;
  final String message;
  String status; // Mutable status field

  BloodRequestModel({
    this.id,
    required this.bloodType,
    required this.quantity,
    required this.message,
    this.status = "pending", // Default value
  });

  // Convert a BloodRequestModel into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bloodType': bloodType,
      'quantity': quantity,
      'message': message,
      'status': status,
    };
  }

  // Create a BloodRequestModel from a Map
  factory BloodRequestModel.fromMap(Map<String, dynamic> map) {
    return BloodRequestModel(
      id: map['id'],
      bloodType: map['bloodType'],
      quantity: map['quantity'],
      message: map['message'],
      status: map['status'] ?? "pending",
    );
  }
}
