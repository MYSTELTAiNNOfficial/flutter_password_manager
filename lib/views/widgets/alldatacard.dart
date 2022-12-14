part of 'widgets.dart';

/*
** Card Widget for All Data By Id User
*/

class AllDataCard extends StatefulWidget {
  final DataByIdUser dataUser;
  const AllDataCard(this.dataUser);

  @override
  _AllDataCardState createState() => _AllDataCardState();
}

class _AllDataCardState extends State<AllDataCard> {
  @override
  Widget build(BuildContext context) {
    DataByIdUser dataUser = widget.dataUser;
    return Card(
      color: Colors.lightBlue[200],
      margin: const EdgeInsets.fromLTRB(16, 8, 20, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(dataUser.id)),
          );
        },
        splashColor: Color.fromARGB(255, 143, 203, 255),
        child: ListTile(
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          title: Text("${dataUser.appName}",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 4),
                child: Text(
                  "Username: ${dataUser.username}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 4),
                child: Text(
                  "Email: ${dataUser.email}",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
