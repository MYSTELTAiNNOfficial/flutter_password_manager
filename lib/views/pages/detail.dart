part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final dynamic dataId;
  const DetailPage(this.dataId);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = false;
  late List<DataByIdUser> allDataByUserId;

  List<DataByIdData> listDetail = [];
  Future<dynamic> getDetailData(dynamic id) async {
    await ServerService.getDataByDataId(id).then((value) {
      setState(() {
        isLoading = false;
        listDetail = value;
      });
      return listDetail;
    });
  }

  Future<dynamic> deleteData(dynamic id) async {
    await ServerService.deleteData(id).then((value) {
      if (value != null) {
        var response = jsonDecode(value.body);
        if (response['status']) {
          setState(() {
            isLoading = false;
          });
          Navigator.pushAndRemoveUntil<dynamic>(
              context,
              MaterialPageRoute<dynamic>(builder: (context) => MenuPage()),
              (route) => false);
          UiToast.toastOk(response['message']);
        } else {
          UiToast.toastErr(response['message']);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getDetailData(widget.dataId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 380,
                      child: listDetail.isEmpty
                          ? const Align(
                              alignment: Alignment.center,
                              child: Text("There is no Data"))
                          : ListView.builder(
                              itemCount: listDetail.length,
                              itemBuilder: (context, index) {
                                return LazyLoadingList(
                                    loadMore: () {},
                                    child: DetailDataCard(listDetail[index]),
                                    index: index,
                                    hasMore: true);
                              },
                            ),
                    ),
                    //SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(44, 0, 44, 0),
                      child: ElevatedButton(
                          onPressed: () async {
                            //Go to edit form
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditFormPage(listDetail)));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            elevation: 0,
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: EdgeInsets.fromLTRB(24, 14, 24, 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("Edit Data")),
                    ),
                    SizedBox(height: 12),

                    Container(
                      padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black54,
                      ),
                    ),

                    SizedBox(height: 12),

                    /*
                    **Delete Data
                    */
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(44, 0, 44, 0),
                      child: ElevatedButton(
                          onPressed: () async {
                            showDialog(
                              useRootNavigator: true,
                              context: this.context,
                              builder: (context) => AlertDialog(
                                title: Text("Delete Data"),
                                content: Text("Are you sure?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      deleteData(widget.dataId);
                                      setState(() {
                                        isLoading = true;
                                      });
                                    },
                                    child: Text("Ok"),
                                  ),
                                ],
                              ),
                            );
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
            ),
            isLoading ? UiLoading.loading() : Container(),
          ],
        ));
  }
}
