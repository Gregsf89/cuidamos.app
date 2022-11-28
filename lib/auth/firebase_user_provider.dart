import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CuidamosFirebaseUser {
  CuidamosFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CuidamosFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CuidamosFirebaseUser> cuidamosFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CuidamosFirebaseUser>(
      (user) {
        currentUser = CuidamosFirebaseUser(user);
        return currentUser!;
      },
    );
