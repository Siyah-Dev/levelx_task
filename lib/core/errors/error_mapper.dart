import 'dart:io';

import 'package:dio/dio.dart';

class ErrorMapper {
  static String getErrorMessage(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          return "Connection timeout. Please try again.";
        case DioExceptionType.badResponse:
          return "Server error. Please try later.";
        case DioExceptionType.connectionError:
          return "No internet connection.";
        case DioExceptionType.cancel:
          return "Request cancelled.";
        default:
          return "Something went wrong. Please try again.";
      }
    }

    if (error is FormatException) {
      return "Invalid response format.";
    }

    if (error is SocketException) {
      return "No internet connection.";
    }

    return "Unexpected error. Please try again.";
  }
}
