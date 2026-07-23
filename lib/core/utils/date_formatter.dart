  String formatDate(String dateStr, String langCode) {
    try {
      final dateTime = DateTime.parse(dateStr);
      final now = DateTime.now();

      final today = DateTime(now.year, now.month, now.day);
      final forecastDate = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
      );

      final difference = forecastDate.difference(today).inDays;

      if (difference == 0) {
        return langCode == 'ar' ? 'اليوم' : 'Today';
      } else if (difference == 1) {
        return langCode == 'ar' ? 'غداً' : 'Tomorrow';
      }
      return '${dateTime.day}/${dateTime.month}';
    } catch (_) {
      return dateStr;
    }
  }