import 'package:dio/dio.dart';

class DioExceptionHandler {
  static String handleException(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
      return "Connection timed out. Please check your internet connection.";
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return "We couldn't fetch data. Please try again later.";
    } else if (error.type == DioExceptionType.sendTimeout) {
      return "Something went wrong with sending data. Please try again.";
    } else if (error.type == DioExceptionType.cancel) {
      return "Request cancelled.";
    } else if (error.type == DioExceptionType.connectionError) {
      return 'Connection Error. Please check your internet connection';
    } else if (error.type == DioExceptionType.badResponse) {
      switch (error.response?.statusCode) {
        case 400:
          return "Bad request. Please check your input.";
        case 401:
          return "Unauthorized access. Please login again.";
        case 403:
          return "Forbidden access. You don't have permission to perform this action.";
        case 404:
          return "Resource not found.";
        case 408:
          return "Request timed out on the server.";
        case 500:
          return "Internal server error. Please try again later.";
        default:
          return "Something went wrong on the server.";
      }
    } else {
      // Handle other DioExceptionType instances or unexpected errors
      return "An unknown error occurred. Please try again.";
    }
  }
}
