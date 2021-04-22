abstract class DatetimeUtil {
  static String? toDateText(DateTime? datetime) {
    if (datetime == null) return '';
    final iso = datetime.toIso8601String();
    final isoDate = iso.substring(0, 10);
    final d = isoDate.split('-');
    return '${d[2]}-${d[1]}-${d[0]}';
  }
}
