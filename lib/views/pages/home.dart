part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  List<DataByIdUser> listData = [];
  Future<dynamic> getAllData() async {
    await MasterDataService.getAllDatas().then((value) {
      setState(() {
        listData = value as List<DataByIdUser>;
      });
      print(listData.toString());
      return listData;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: listData.isEmpty
                  ? const Align(
                      alignment: Alignment.center,
                      child: Text("There is no Data"))
                  : ListView.builder(
                      itemCount: listData.length,
                      itemBuilder: (context, index) {
                        // return LazyLoadingList(
                        //     loadMore: () {},
                        //     child: AllDataCard(listData[index]),
                        //     index: index,
                        //     hasMore: true);
                        return Container();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
