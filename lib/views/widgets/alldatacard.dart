part of 'widgets.dart';

class AllDataCard extends StatefulWidget {
  final AllDataStatus allDataStatus;
  const AllDataCard(this.allDataStatus);

  @override
  _AllDataCardState createState() => _AllDataCardState();
}

class _AllDataCardState extends State<AllDataCard> {
  @override
  Widget build(BuildContext context) {
    // DataByIdUser dataUser = widget.dataUser;
    AllDataStatus allData = widget.allDataStatus;
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
          title: Text("${allData.data!.elementAt(0).appName}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Text(
                "Username: ${allData.data!.elementAt(0).username}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Email: ${allData.data!.elementAt(0).email}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
