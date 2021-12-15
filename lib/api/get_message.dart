// function returns the appropriate message for firebase exceptions

String getMessage(String code) {
  String message = "";
  if (code == "email-already-in-use") {
    message = "email already taken";
  } else if (code == "invalid-email") {
    message = "invalid email";
  } else if (code == "operation-not-allowed") {
    message = "enable your account";
  } else if (code == "weak-password") {
    message = "password is too weak";
  } else if (code == "user-disabled") {
    message = "account disabled";
  } else if (code == "user-not-found") {
    message = "account doesn't exist";
  } else if (code == "wrong-password") {
    message = "wrong password";
  }
  return message;
}
