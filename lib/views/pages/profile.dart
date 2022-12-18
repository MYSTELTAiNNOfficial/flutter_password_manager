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

      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Profile'),
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 32),
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage("${AuthService.auth.currentUser!.photoURL}"),
            ),
            SizedBox(height: 20),
            Text("Username: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text("${AuthService.auth.currentUser!.displayName}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text("Email: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text("${AuthService.auth.currentUser!.email}",
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
