part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var userDisplayName = "";
  var userEmail = "";

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  void getUserProfile() async {
    var tempDisplayName = await AuthService.getDisplayName();
    var tempEmail = await AuthService.getEmail();
    setState(() {
      userDisplayName = tempDisplayName;
      userEmail = tempEmail;
    });
  }

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Text("User Display Name: $userDisplayName"),
              Text("User Email: $userEmail"),
            ],
          ),
        ));
  }
}
