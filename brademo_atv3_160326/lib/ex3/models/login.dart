class Login {
  final String email;
  final String password;

  const Login({required this.email, required this.password});

  bool get isValid => email == 'admin' && password == '1234';
}
