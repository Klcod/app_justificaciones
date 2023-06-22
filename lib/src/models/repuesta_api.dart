
class RespuestaApi {
  bool success;
  String message;
  dynamic helperData;
  
  RespuestaApi({required this.success, required this.message, this.helperData });

  factory RespuestaApi.fromJson(Map<String, dynamic> json) => RespuestaApi(
    success: json['success'], 
    message: json['message'],
    helperData: json['helper_data']
  );

  Map<String, dynamic> toJson() => {
    'success' : success,
    'message': message,
    'helper_data': helperData
  };
}