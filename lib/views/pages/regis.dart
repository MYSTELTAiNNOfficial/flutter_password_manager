part of 'pages.dart';

class RegisPage extends StatefulWidget {
  const RegisPage({Key? key}) : super(key: key);

  @override
  _RegisPageState createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {
  final _regiskey = GlobalKey<FormState>();
  final ctrlUser = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  final ctrlConfirmPass = TextEditingController();
  bool isHide = true;
  bool isHide2 = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ctrlUser.dispose();
    ctrlEmail.dispose();
    ctrlPass.dispose();
    ctrlConfirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // Here we take the value from the RegisPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            // color: Colors.orange,
            width: double.infinity,
            height: 420,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Center(
              child: Form(
                key: _regiskey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: ctrlUser,
                      decoration: InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      validator: (value) {
                        return value!.length < 4
                            ? "Username must at least 4 characters!"
                            : null;
                      },
                    ),
                    SizedBox(height: 16),
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
                    SizedBox(height: 16),
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
                    SizedBox(height: 16),
                    TextFormField(
                      obscureText: isHide2,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: ctrlConfirmPass,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        suffixIcon: new GestureDetector(
                          onTap: () {
                            setState(() {
                              isHide2 = !isHide2;
                            });
                          },
                          child: Icon(
                            isHide2 ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) {
                        return value!.length < 6
                            ? "Password must at least 6 characters!"
                            : null;
                      },
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            // signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            elevation: 0,
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("REGISTER")),
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
