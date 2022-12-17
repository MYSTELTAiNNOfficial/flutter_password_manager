part of 'widgets.dart';

class DetailDataCard extends StatefulWidget {
  final DetailDataStatus detailData;
  const DetailDataCard(this.detailData);

  @override
  _DetailDataCardState createState() => _DetailDataCardState();
}

class _DetailDataCardState extends State<DetailDataCard> {
  @override
  Widget build(BuildContext context) {
    DetailDataStatus detailData = widget.detailData;
    return Card(
      color: Colors.lightBlue,
      margin: const EdgeInsets.fromLTRB(16, 8, 20, 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(
              "App Name:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${detailData.data!.elementAt(0).appName}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Nickname:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${detailData.data!.elementAt(0).username}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Email:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${detailData.data!.elementAt(0).email}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Password:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${detailData.data!.elementAt(0).password}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${detailData.data!.elementAt(0).description}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
