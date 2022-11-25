


 bool isEmailValid(String email) {
if (email.isNotEmpty) {
bool emailValid = RegExp(
r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(email);
return !emailValid;
}
return true;
}
 bool isUrlValid(String email) {
  if (email.isNotEmpty) {
   bool emailValid = RegExp(
       r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)')
       .hasMatch(email);
   return !emailValid;
  }
  return true;
 }

