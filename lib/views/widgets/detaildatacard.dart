part of 'widgets.dart';

class DetailDataCard extends StatefulWidget {
  final DataByIdData dataByIdData;
  const DetailDataCard(this.dataByIdData);

  @override
  _DetailDataCardState createState() => _DetailDataCardState();
}

class _DetailDataCardState extends State<DetailDataCard> {
  @override
  Widget build(BuildContext context) {
    DataByIdData detailData = widget.dataByIdData;
    return Card(
      color: const Color(0x60C6FF),
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
              "${detailData.appName}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Username:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${detailData.username}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Email:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${detailData.email}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Password:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${detailData.password}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "${detailData.description}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
