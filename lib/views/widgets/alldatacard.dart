part of 'widgets.dart';

class AllDataCard extends StatefulWidget {
  final GetDataByIdUser dataUser;
  const AllDataCard(this.dataUser);

  @override
  _AllDataCardState createState() => _AllDataCardState();
}

class _AllDataCardState extends State<AllDataCard> {
  @override
  Widget build(BuildContext context) {
    GetDataByIdUser dataUser = widget.dataUser;
    return Card(
      color: Colors.lightBlue,
      margin: const EdgeInsets.fromLTRB(16, 8, 20, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2,
      child: InkWell(
        onTap: () {},
        splashColor: Color.fromARGB(255, 143, 203, 255),
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          title: Text("${dataUser.appName}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Text(
                "Username: ${dataUser.username}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Email: ${dataUser.email}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
