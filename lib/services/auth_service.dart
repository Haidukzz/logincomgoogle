import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Configura o GoogleSignIn com o Client ID
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: '878979654083-1g9tjda0u1885u05d3jt29a5c2akqnrs.apps.googleusercontent.com',
);


  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Método para fazer login com Google
  static Future<User?> signInWithGoogle() async {
    try {
      // Tenta realizar o login pelo Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print('Login cancelado pelo usuário.');
        return null; // Retorna null se o usuário cancelar
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Cria as credenciais do Firebase
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Faz o login no Firebase
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // Salva as informações do usuário no Firestore
        await _saveUserToFirestore(user);
      }

      return user;
    } catch (e) {
      print('Erro no login com Google: $e');
      return null;
    }
  }

  /// Método para salvar usuário no Firestore
  static Future<void> _saveUserToFirestore(User user) async {
    try {
      final DocumentReference userDoc =
          _firestore.collection('users').doc(user.uid);

      final DocumentSnapshot docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        // Salva os dados do usuário apenas se ele não existir
        await userDoc.set({
          'name': user.displayName ?? 'Usuário sem nome',
          'email': user.email ?? 'Email não disponível',
          'photoURL': user.photoURL ?? '',
          'createdAt': FieldValue.serverTimestamp(),
        });
        print('Usuário salvo no Firestore.');
      } else {
        print('Usuário já existe no Firestore.');
      }
    } catch (e) {
      print('Erro ao salvar usuário no Firestore: $e');
    }
  }

  /// Método para fazer logout
  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut(); // Desloga do Google
      await _auth.signOut(); // Desloga do Firebase
      print('Usuário deslogado com sucesso.');
    } catch (e) {
      print('Erro ao deslogar: $e');
    }
  }
}
