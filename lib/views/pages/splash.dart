part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final SplashDelay = 4;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = new Duration(seconds: SplashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    var currentUserUid = await AuthService.getUid();
    if (currentUserUid != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MenuPage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Container(
          alignment: Alignment.center,
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: double.infinity,
            height: double.infinity,
          )),
    );
  }
}
