class KValidation {
  static String? isEmpty({required String? value, required String formName}) {
    if (value == null || value.isEmpty) return "$formName must not be empty";
    return null;
  }
}
