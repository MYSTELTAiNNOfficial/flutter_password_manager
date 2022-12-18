part of 'pages.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = false;
  int id = 1;

  List<DataByIdData> listDetail = [];
  Future<dynamic> getDetailData(dynamic id) async {
    await ServerService.getDataByDataId(id).then((value) {
      setState(() {
        listDetail = value as List<DataByIdData>;
      });
      print(listDetail.toString());
      return listDetail;
    });
  }

  @override
  void initState() {
    super.initState();
    getDetailData(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: listDetail.isEmpty
                  ? const Align(
                      alignment: Alignment.center,
                      child: Text("There is no Data"))
                  : ListView.builder(
                      itemCount: listDetail.length,
                      itemBuilder: (context, index) {
                        // return LazyLoadingList(
                        //     loadMore: () {},
                        //     child: DetailDataCard(listDetail[index]),
                        //     index: index,
                        //     hasMore: true);
                        return Container();
                      },
                    ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    //Go to edit form
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => FormPage()));
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
                  child: Text("Edit Data")),
            ),
            SizedBox(height: 12),
            Divider(thickness: 1),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    //Delete Data
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MenuPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 0,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.fromLTRB(24, 14, 24, 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Delete Data")),
            ),
          ],
        ),
      ),
    );
  }
}
