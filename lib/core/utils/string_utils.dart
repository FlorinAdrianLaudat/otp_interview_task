class StringUtils {
  static bool isNotNullOrEmpty(String? input) {
    if (input != null && input.isNotEmpty) {
      return true;
    }
    return false;
  }
}
