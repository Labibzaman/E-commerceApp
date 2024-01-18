class ResponseData {
  final int statusCode;
  final bool isSuccess;
  final dynamic responseData;
  final String errorMessage;

  ResponseData({
    this.errorMessage = 'Something went wrong',
    required this.isSuccess,
    required this.responseData,
    required this.statusCode,
  });
}
