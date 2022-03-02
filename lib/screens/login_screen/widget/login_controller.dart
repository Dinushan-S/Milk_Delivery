import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    // _googleSignIn.signIn().then((account) {
    //   googleUser.value = account;
    // });
    googleAccount.value = await _googleSignIn.signIn();
  }
}
