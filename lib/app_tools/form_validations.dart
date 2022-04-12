class FormValidation {
  static String? emailValidator({String val = "", bool requered = false}) {
    if (requered) {
      if (val.isEmpty) {
        return "Email Zorunlu Alan";
      } else if (!val.contains("@")) {
        return "Lütfen Geçerli Bir Email Girin";
      }
    }
  }

  static String? notEmty(String? val) {
    if (val == null) {
      return "Bu Alan Boş Olamaz";
    } else if (val.isEmpty) {
      return "Bu Alan Boş Olamaz";
    }
  }

  static String? passwordValidator(String? val) {
    if (val == null) {
      return "Bu Alan Boş Olamaz";
    } else if (val.isEmpty) {
      return "Bu Alan Boş Olamaz";
    } else if (val.length < 5) {
      return "Şifre 5 Karakterden Küçük Olamaz";
    }
  }

  static String? phoneNumberValidator(val) {
    if (val == null) {
      return "Bu Alan Boş Olamaz";
    } else if (val.isEmpty) {
      return "Bu Alan Boş Olamaz";
    } else if (val.length != 11) {
      return "Lütfen Geçerli Bir Telefon Girin";
    } else if (val[0] == "0" || val[0] == "+" || val[0] == "9") {
      return "Lütfen 0,+,9 İle Başlayan Bir Telefon Girmeyin";
    }
  }
}
