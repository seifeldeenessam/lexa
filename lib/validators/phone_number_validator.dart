String? phoneNumberValidator(String countryCode, String? phoneNumber) {
  if (phoneNumber == null || phoneNumber.isEmpty) return "Phone number can't be empty";
  if (!RegExp(r'^[+0-9]{13}$').hasMatch(countryCode + phoneNumber)) return "Invalid phone number";
  return null;
}
