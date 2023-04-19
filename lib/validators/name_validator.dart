String? nameValidator(String? name) {
  if (name == null || name.isEmpty) return "Name can't be empty";
  if (!RegExp(r'^[a-z A-Z ا-ي]+$').hasMatch(name)) return "Invalid name";
  return null;
}
