part of 'pages.dart';

class AddFormPage extends StatefulWidget {
  const AddFormPage({Key? key}) : super(key: key);

  @override
  _AddFormPageState createState() => _AddFormPageState();
}

class _AddFormPageState extends State<AddFormPage> {
  final _formkey = GlobalKey<FormState>();
  final ctrlAppName = TextEditingController();
  final ctrlUsername = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  final ctrlDesc = TextEditingController();
  bool isHide = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ctrlAppName.dispose();
    ctrlUsername.dispose();
    ctrlEmail.dispose();
    ctrlPass.dispose();
    ctrlDesc.dispose();
    super.dispose();
  }

  Future<dynamic> addDataToServer() async {
    var appName = ctrlAppName.text;
    var username = ctrlUsername.text;
    var email = ctrlEmail.text;
    var pass = ctrlPass.text;
    var desc = ctrlDesc.text;
    dynamic response;

    await ServerService.addData(appName, username, email, pass, desc)
        .then((value) {
      if (value != null) {
        response = jsonDecode(value.body);
        setState(() {
          isLoading = false;
        });
        if (response['status']) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MenuPage()));
          UiToast.toastOk(response['message']);
        } else {
          UiToast.toastErr(response['message']);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: double.infinity,
                  height: 550,
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.text,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: ctrlAppName,
                            decoration: InputDecoration(
                              labelText: "App Name",
                              prefixIcon: Icon(Icons.app_registration),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'app name is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: ctrlUsername,
                            decoration: InputDecoration(
                              labelText: "Username",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ),
                            validator: (value) {
                              if (value == null || value.isNotEmpty) {
                                return value!.length < 2
                                    ? "Username must at least 2 characters!"
                                    : null;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: ctrlEmail,
                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.mail),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ),
                            validator: (value) {
                              if (value == null || value.isNotEmpty) {
                                return !EmailValidator.validate(
                                        value.toString())
                                    ? 'Email is not valid!'
                                    : null;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: ctrlPass,
                            obscureText: isHide,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              suffixIcon: IconButton(
                                icon: Icon(isHide
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    isHide = !isHide;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              return value!.length < 4
                                  ? "please fill the password, password must at least 4 characters!"
                                  : null;
                            },
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            controller: ctrlDesc,
                            maxLines: 2,
                            decoration: InputDecoration(
                              labelText: "Description",
                              prefixIcon: Icon(Icons.description),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ),
                          ),
                          SizedBox(height: 14),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  addDataToServer();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 3,
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text('Finish'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            isLoading ? UiLoading.loading() : Container(),
          ],
        ));
  }
}
