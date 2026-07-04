import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> signInWithGoogle();
  Future<void> signOut();
  Stream<UserModel?> get authStateChanges;
  UserModel? get currentUser;
}

class FirebaseAuthRemoteDataSource implements AuthRemoteDataSource {
  final firebase.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthRemoteDataSource({
    firebase.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.instance {
    // Initialize GoogleSignIn for mobile only
    if (!kIsWeb) {
      _googleSignIn.initialize(
        serverClientId: '293856291008-bqedc3vdqugnkpnodu2omnj1d3ihvq5g.apps.googleusercontent.com',
      );
    }
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) return null;
      return UserModel.fromFirebaseUser(firebaseUser);
    });
  }

  @override
  UserModel? get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) return null;
    return UserModel.fromFirebaseUser(firebaseUser);
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        // Web: use popup to avoid DWDS initialization issues
        final googleProvider = firebase.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(googleProvider);
        final firebaseUser = userCredential.user;
        if (firebaseUser == null) return null;
        return UserModel.fromFirebaseUser(firebaseUser);
      } else {
        // Mobile: use native Google Sign-In flow (v7.2.0 API)
        final GoogleSignInAccount googleUser;
        try {
          googleUser = await _googleSignIn.authenticate();
        } catch (e) {
          debugPrint('Google Sign-In Authentication failed: $e');
          return null; // User cancelled or error
        }

        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = firebase.GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
        );

        final userCredential = await _firebaseAuth.signInWithCredential(credential);
        final firebaseUser = userCredential.user;
        if (firebaseUser == null) return null;
        return UserModel.fromFirebaseUser(firebaseUser);
      }
    } catch (e) {
      debugPrint('AuthRemoteDataSource: Google Sign-In error: $e');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      if (!kIsWeb) {
        await _googleSignIn.signOut();
      }
      await _firebaseAuth.signOut();
    } catch (e) {
      debugPrint('AuthRemoteDataSource: Sign-out error: $e');
      rethrow;
    }
  }
}
