import 'package:firebase_auth/firebase_auth.dart';
import '../model/user_model.dart';

class FirebaseAuthenticationService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<UserModel?> get user {
    return _firebaseAuth.authStateChanges().map(
      (event) => _userFromFirebaseUser(event),
    );
  }

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Future<UserModel?> createUserWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return _userFromFirebaseUser(user);
  }

  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async{
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return _userFromFirebaseUser(user);
  }

}