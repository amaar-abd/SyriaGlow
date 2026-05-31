import 'package:dio/dio.dart';
import 'package:syria_glow/core/errors/failure.dart';

class DioErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return Failure(message: "حدث خطأ غير متوقع، يرجى المحاولة لاحقاً");
    }
  }

  static ServerFailure _handleDioError(DioException error) {
    final String? statusCode = error.response?.statusCode?.toString();

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          message: "انتهت مهلة الاتصال بالخادم، تحقق من الشبكة",
          code: statusCode,
        );

      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);

      case DioExceptionType.connectionError:
        return ServerFailure(
          message: "لا يوجد اتصال بالإنترنت، يرجى التحقق من الشبكة",
          code: statusCode,
        );
      case DioExceptionType.unknown:
        if (error.error != null && error.error.toString().contains('SocketException')) {
          return ServerFailure(
            message: "لا يوجد اتصال بالإنترنت، يرجى التحقق من الشبكة",
            code: statusCode,
          );
        }
        return ServerFailure(
          message: "عذراً، حدث خطأ أثناء الاتصال بالسيرفر",
          code: statusCode,
        );

      case DioExceptionType.cancel:
        return ServerFailure(
          message: "تم إلغاء الطلب من قبل المستخدم",
          code: statusCode,
        );

      default:
        return ServerFailure(
          message: "عذراً، حدث خطأ أثناء الاتصال بالسيرفر",
          code: statusCode,
        );
    }
  }

  static ServerFailure _handleBadResponse(Response? response) {
    final String? statusCode = response?.statusCode?.toString();

    if (response != null && response.data != null) {
      final data = response.data;
      if (data['errors'] != null && data['errors'] is Map) {
        final Map<String, dynamic> errorsMap = data['errors'];

        if (errorsMap.isNotEmpty) {
          final firstErrorList = errorsMap.values.first;
          if (firstErrorList is List && firstErrorList.isNotEmpty) {
            return ServerFailure(
              message: firstErrorList.first.toString(),
              code: statusCode,
            );
          }
        }
      }
      final String errorMessage = data['message'] ?? "حدث خطأ ما في الخادم";
      return ServerFailure(message: errorMessage, code: statusCode);
    }

    return ServerFailure(message: "استجابة خاطئة من السيرفر", code: statusCode);
  }
}
