import 'package:bookapp_umg/data/common/bood_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/book_data.dart';


abstract class AppRepository {
  Future<bool> register(String email, String password);

  Future<bool> logIn(String email, String password);

  Future<bool> authWithGoogle();

  Future<String> getDownloadURL(String gsUrl);

  Future<BookData> getBookById(String id);

  Future<String> getAudioDownloadURL(String gsUrl);

  void logOut();

  void unRegister();


}

class AppRepositoryImpl extends AppRepository {

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<String> getDownloadURL(String gsUrl) async {
    try {
      if (!gsUrl.startsWith('gs://')) return gsUrl;
      final ref = FirebaseStorage.instance.refFromURL(gsUrl);
      return await ref.getDownloadURL();
    } catch (e) {
      print("Error fetching download URL: $e");
      return 'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/81YkqyaFVEL._AC_UF1000,1000_QL80_.jpg';
    }
  }

  @override
  Future<String> getAudioDownloadURL(String gsUrl) async {
    final ref = FirebaseStorage.instance.refFromURL(gsUrl);
    return await ref.getDownloadURL();
  }



  @override
  Future<bool> register(String email, String password) async {
    print("register method repo");
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (error) {
      print("Error: $error");
      return false;
    }
  }

  @override
  Future<bool> logIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (error) {
      print("Error: $error");
      return false;
    }
  }

  @override
  Future<BookData> getBookById(String id) async {
    try {
      QuerySnapshot snapshot =
      await _firestore.collection('book').where('id', isEqualTo: id).get();

      if (snapshot.docs.isNotEmpty) {
        Map<String, dynamic> bookData =
        snapshot.docs.first.data() as Map<String, dynamic>;
        return BookData.fromJson(bookData);
      } else {
        throw Exception('Book not found');
      }
    } catch (e) {
      print("Error getBookById: ${e.toString()}");
      return BookData();
    }
  }

  @override
  void unRegister() async {
      await FirebaseAuth.instance.currentUser?.delete();
  }

  @override
  void logOut() async {
      await FirebaseAuth.instance.signOut();
  }

  Future<bool> authWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return false;

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      return false;
    }
  }

}
