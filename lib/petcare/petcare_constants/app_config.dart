// ignore_for_file: constant_identifier_names

class AppConfig {
  // change base url depending on your local host
  static const userBaseUrl = "http://localhost:5005/api/UserAccount/";

  static const signUp = "${userBaseUrl}signup-user";
  static const login = "http://localhost:5005/connect/token";
  static const validate_otp = "${userBaseUrl}validate-otp";
  static const resend_otp = "${userBaseUrl}resend-otp";
  static const change_password = "${userBaseUrl}change-password";
  static const edit_account = "${userBaseUrl}edit-user-account";

  // /validate-otp?
}
