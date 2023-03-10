validateEmail(String? email) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    caseSensitive: false,
    multiLine: false,
  );
  return emailRegex.hasMatch(email ?? '');
}

validatePassword(String? password) {
  // expresion regular para saber si es mayor a 6 caracteres
  final RegExp passwordRegex = RegExp(
    r'^.{6,}$',
    caseSensitive: false,
    multiLine: false,
  );
  return passwordRegex.hasMatch(password ?? '');
}

validateName(String? name) {
  final RegExp nameRegex = RegExp(
    r'^[a-zA-Z]+(([[a-zA-Z ])?[a-zA-Z]*)*$',
    caseSensitive: false,
    multiLine: false,
  );
  return nameRegex.hasMatch(name ?? '');
}

validateDate(String? d) {
  final RegExp dateRegex = RegExp(
    r'^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$',
    caseSensitive: false,
    multiLine: false,
  );

  if (d != null && dateRegex.hasMatch(d)) {
    List<String> date = d.split('/');
    int day = int.parse(date[0]);
    int month = int.parse(date[1]);
    int year = int.parse(date[2]);

    if (day < 1 || day > 31) {
      return false;
    }
    if (month < 1 || month > 12) {
      return false;
    }
    if (year < 1900 || year > 2023) {
      return false;
    }
    if (month == 2) {
      if (day > 29) {
        return false;
      }
      if (day == 29) {
        if (year % 4 != 0) {
          return false;
        }
        if (year % 100 == 0) {
          if (year % 400 != 0) {
            return false;
          }
        }
      }
    }
  }
  return dateRegex.hasMatch(d ?? '');
}

validateAddress(String? address) {
  final RegExp addressRegex = RegExp(
    r'^[a-zA-Z0-9]+(([[a-zA-Z0-9 ])?[a-zA-Z0-9]*)*$',
    caseSensitive: false,
    multiLine: false,
  );
  return addressRegex.hasMatch(address ?? '');
}
