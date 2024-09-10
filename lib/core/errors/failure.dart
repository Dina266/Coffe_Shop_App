import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class AuthFailure extends Failure {
  AuthFailure(super.errorMessage);

  factory AuthFailure.firebaseAuth(
      FirebaseAuthException firebaseAuthException) {
    if (firebaseAuthException.code == 'user-not-found') {
      return AuthFailure('هذا البريد الالكتروني غير موجود');
    } else if (firebaseAuthException.code == 'wrong-password') {
      return AuthFailure('كلمة المرور غير صحيحة');
    } else if (firebaseAuthException.code == 'weak-password') {
      return AuthFailure('كلمة المرور ضعيفة');
    } else if (firebaseAuthException.code == 'email-already-in-use') {
      return AuthFailure('this email already exists');
    } else {
      return AuthFailure('حدث خطأ ما');
    }
  }
}
