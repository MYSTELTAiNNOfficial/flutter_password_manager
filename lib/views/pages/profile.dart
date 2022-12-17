part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthService.signOut().then((value) {
                  if (value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    UiToast.toastOk("Logout successful!");
                  } else {
                    UiToast.toastErr("Logout failed!");
                  }
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
