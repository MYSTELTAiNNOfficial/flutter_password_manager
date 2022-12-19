part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<DataByIdUser> allDataByUserId = [];

  Future<List<DataByIdUser>> getDatas() async {
    await ServerService.getDataByUserId().then((value) {
      if (value != null) {
        setState(() {
          allDataByUserId = value;
          isLoading = false;
        });
      }
    });
    return allDataByUserId;
  }

  @override
  void initState() {
    isLoading = true;
    getDatas().then((value) => {
          allDataByUserId = value,
        });
    super.initState();
  }

  @override
  void dispose() {
    allDataByUserId.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: isLoading
          ? UiLoading.loading()
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: allDataByUserId.isEmpty
                  ? const Align(
                      alignment: Alignment.center,
                      child: Text("Ups, tidak ada data"))
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
