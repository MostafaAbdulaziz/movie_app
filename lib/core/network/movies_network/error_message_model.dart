class ErrorMessageModel {
  final bool success;
  final String statusCode;
  final String statusMessage;

  const ErrorMessageModel(
      {required this.statusCode,
      required this.statusMessage,
      required this.success});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
          statusCode: json['status_code'],
          statusMessage: json['status_message'],
          success: json['success']);
}
