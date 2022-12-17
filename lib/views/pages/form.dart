part of 'pages.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formkey = GlobalKey<FormState>();
  final ctrlAppName = TextEditingController();
  final ctrlNickname = TextEditingController();
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
    ctrlNickname.dispose();
    ctrlEmail.dispose();
    ctrlPass.dispose();
    ctrlDesc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: ListView(
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      controller: ctrlNickname,
                      decoration: InputDecoration(
                        labelText: "Nickname",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                      validator: (value) {
                        if (value == null || value.isNotEmpty) {
                          return value!.length < 2
                              ? "nickname must at least 2 characters!"
                              : null;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
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
                        if (value == null || value.isNotEmpty) {
                          return !EmailValidator.validate(value.toString())
                              ? 'Email is not valid!'
                              : null;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: ctrlPass,
                      obscureText: isHide,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        suffixIcon: IconButton(
                          icon: Icon(
                              isHide ? Icons.visibility_off : Icons.visibility),
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
                            Future.delayed(Duration(seconds: 2), () {
                              setState(() {
                                isLoading = false;
                              });
                              UiToast.toastOk("Successfully added data!");
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MenuPage(),
                                ),
                              );
                            });
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
    );
  }
}
