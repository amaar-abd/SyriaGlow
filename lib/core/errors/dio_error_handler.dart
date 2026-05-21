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
      final String errorMessage =
          response.data['message'] ?? "حدث خطأ ما في الخادم";
      return ServerFailure(message: errorMessage, code: statusCode);
    }
    return ServerFailure(message: "استجابة خاطئة من السيرفر", code: statusCode);
  }
}
