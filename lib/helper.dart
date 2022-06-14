class Helpers {


  static String? validateEmpty(String value, String label) {
    if (value.isEmpty) {
      return '$label is required';
    }
    return null;
  }


}