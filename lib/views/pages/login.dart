part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginkey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  bool isHide = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            // color: Colors.orange,
            width: double.infinity,
            height: 400,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Center(
              child: Form(
                key: _loginkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: ctrlEmail,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      validator: (value) {
                        return !EmailValidator.validate(value.toString())
                            ? 'Email is not valid!'
                            : null;
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      obscureText: isHide,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: ctrlPass,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        suffixIcon: new GestureDetector(
                          onTap: () {
                            setState(() {
                              isHide = !isHide;
                            });
                          },
                          child: Icon(
                            isHide ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) {
                        return value!.length < 6
                            ? "Password must at least 6 characters!"
                            : null;
                      },
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            // signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 0,
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: EdgeInsets.fromLTRB(24, 14, 24, 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("LOGIN")),
                    ),
                    SizedBox(height: 8),
                    Divider(thickness: 1, color: Colors.black),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            // signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 0,
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: EdgeInsets.fromLTRB(24, 14, 24, 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("Sign In with Google")),
                    ),
                    SizedBox(height: 4),
                    Align(
                      alignment: Alignment(0, 0.89),
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisPage()));
                        },
                        child: Text(
                          "Don't have account? Sign up here!",
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
