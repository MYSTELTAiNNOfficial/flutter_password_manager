part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GetDataByIdUser> allDataByUserId = [];

  Future<List<GetDataByIdUser>> getDatas() async {
    await ServerService.getDataByUserId().then((value) {
      setState(() {
        allDataByUserId = value;
      });
    });
    return allDataByUserId;
  }

  @override
  void initState() {
    super.initState();
    getDatas().then((value) => {
          allDataByUserId = value,
        });
  }

  @override
  void dispose() {
    allDataByUserId.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: allDataByUserId.isEmpty
            ? const Align(
                alignment: Alignment.center, child: Text("Ups, tidak ada data"))
            : ListView.builder(
                itemCount: allDataByUserId.length,
                itemBuilder: ((context, index) {
                  return LazyLoadingList(
                      initialSizeOfItems: 10,
                      loadMore: () {},
                      child: AllDataCard(allDataByUserId[index]),
                      index: index,
                      hasMore: true);
                })),

      ),
    );
  }
}
