import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';

import 'login_functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Login',
      theme: ThemeData(
          primarySwatch: Colors.blue), //const MaterialColor(0xFF6666FF, color)
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginScreen(),
        '/forgotPass': (BuildContext context) => const ForgotPasswordScreen(),
      },
    );
  }

  static const Map<int, Color> color = {
    50: Color.fromRGBO(4, 131, 184, .1),
    100: Color.fromRGBO(4, 131, 184, .2),
    200: Color.fromRGBO(4, 131, 184, .3),
    300: Color.fromRGBO(4, 131, 184, .4),
    400: Color.fromRGBO(4, 131, 184, .5),
    500: Color.fromRGBO(4, 131, 184, .6),
    600: Color.fromRGBO(4, 131, 184, .7),
    700: Color.fromRGBO(4, 131, 184, .8),
    800: Color.fromRGBO(4, 131, 184, .9),
    900: Color.fromRGBO(4, 131, 184, 1),
  };
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  /// Simulates the multilanguage, you will implement your own logic.
  /// According to the current language, you can display a text message
  /// with the help of [LoginTexts] class.
  final String langCode = 'en';

  @override
  Widget build(BuildContext context) {
    return AnimatedLogin(
      onLogin: LoginFunctions(context).onLogin,
      onSignup: LoginFunctions(context).onSignup,
      onForgotPassword: LoginFunctions(context).onForgotPassword,
      formWidthRatio: 60,
      logo: 'images/logo.gif',
      // backgroundImage: 'images/background_image.jpg',
      signUpMode: SignUpModes.both,
      socialLogins: _socialLogins(context),
      loginTheme: _loginTheme,
      loginTexts: _loginTexts,
    );
  }

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginTheme get _loginTheme => LoginTheme(
        // showLabelTexts: false,
        backgroundColor: Colors.blue, // const Color(0xFF6666FF),
        formFieldBackgroundColor: Colors.white,
        changeActionTextStyle: const TextStyle(color: Colors.white),
      );

  LoginTexts get _loginTexts => LoginTexts(
        nameHint: _username,
        login: _login,
        signUp: _signup,
      );

  /// You can adjust the texts in the screen according to the current language
  /// With the help of [LoginTexts], you can create a multilanguage scren.
  String get _username => langCode == 'tr' ? 'Kullanıcı Adı' : 'Username';
  String get _login => langCode == 'tr' ? 'Giriş Yap' : 'Login';
  String get _signup => langCode == 'tr' ? 'Kayıt Ol' : 'Sign Up';

  /// Social login options, you should provide callback function and icon path.
  /// Icon paths should be the full path in the assets
  /// Don't forget to also add the icon folder to the "pubspec.yaml" file.
  List<SocialLogin> _socialLogins(BuildContext context) => <SocialLogin>[
        SocialLogin(
            callback: () async => LoginFunctions(context).socialLogin('Google'),
            iconPath: 'images/google.png'),
        SocialLogin(
            callback: () async =>
                LoginFunctions(context).socialLogin('Facebook'),
            iconPath: 'images/facebook.png'),
        SocialLogin(
            callback: () async =>
                LoginFunctions(context).socialLogin('Linkedin'),
            iconPath: 'images/linkedin.png'),
      ];
}

/// Example forgot password screen that user is navigated to
/// after clicked on "Forgot Password?" text.

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('FORGOT PASSWORD'),
      ),
    );
  }
}
