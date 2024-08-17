import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/errors/failure.dart';

class FirebaseAuthService {
  final user = FirebaseAuth.instance;

  Future<void> emailVerification() async {
    try {
      await user.currentUser!.sendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Either<Failure, User>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await user.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(credential.user!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          AuthFailure.firebaseAuth(e),
        );
      }
      return left(
        AuthFailure('somthing went wrong'),
      );
    }
  }

  Future<Either<Failure, User>> loginWithEmailAndPassWord({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await user.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(credential.user!);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(
          AuthFailure.firebaseAuth(e),
        );
      }
      return left(
        AuthFailure('somthing went wrong'),
      );
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      AuthFailure('somthing went wrong');
    }
  }
}
