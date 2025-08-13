sealed class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  LoginSubmitted({
    required this.email,
    required this.password,
    required this.role,
  });

  final String email;
  final String password;
  final String role;
}
