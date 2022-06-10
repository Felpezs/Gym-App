import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String?> get user {
    return _firebaseAuth.authStateChanges().map(
      (event) => _uidFromFirebaseUser(event),
    );
  }

  String? _uidFromFirebaseUser(User? user) {
    return user != null ? user.uid : null;
  }

  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return _uidFromFirebaseUser(user);
  }

  Future<String?> signInWithEmailAndPassword(String email, String password) async{
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return _uidFromFirebaseUser(user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

}