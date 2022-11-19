String validateEmail(String value) {
  final RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  late String _msg;
  if (value.isEmpty) {
    _msg = "Votre nom d'utilisateur est requis";
  } else if (!regex.hasMatch(value)) {
    _msg = "Veuillez entrer un email valide";
  }
  return _msg;
}
