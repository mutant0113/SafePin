import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SafepingFirebaseUser {
  SafepingFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

SafepingFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SafepingFirebaseUser> safepingFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SafepingFirebaseUser>(
            (user) => currentUser = SafepingFirebaseUser(user));
