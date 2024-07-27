//model for a blood request
class BloodRequestModel {
  final int? id;
  final String bloodType;
  final int quantity;
  final String message;
  late final String status; // "pending", "approved", "denied"

  BloodRequestModel({
    this.id,
    required this.bloodType,
    required this.quantity,
    required this.message,
    this.status = "pending",
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bloodType': bloodType,
      'quantity': quantity,
      'message': message,
      'status': status,
    };
  }
}
