// ignore_for_file: camel_case_types, non_constant_identifier_names, body_might_complete_normally_nullable

class gettextform {
  String email;
  String password;
  bool IsNotEmpty;
  bool park() {
    return true;
  }

  gettextform(
      {required this.email, required this.password, this.IsNotEmpty = false});
}

class checkmarklist {
  bool value;
  String title;
  checkmarklist({required this.title, this.value = false});
}

// String? Function(String?)? val(String formText) {
//   debugPrint('form: ' + formText);
//   if (formText.isEmpty) {
//     return (error) {
//       return 'Field is required.';
//     };
//   }
// }
