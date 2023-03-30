class RegExps {
  static get password => RegExp(r"/((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/");
}
