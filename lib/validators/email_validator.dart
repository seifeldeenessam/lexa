String? emailValidator(String? email) {
  if (email == null || email.isEmpty) return "Email can't be empty";
  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) return "Invalid email";
  return null;
}
