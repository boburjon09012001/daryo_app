import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api_response.dart';
import '../../main_viewmodel.dart';
import 'news_item.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  MainViewModel? _mainVM;

  @override
  void initState() {
    super.initState();

    _mainVM = Provider.of<MainViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: FutureBuilder(
        future: _mainVM?.fetchNews(),
        builder: (BuildContext context, AsyncSnapshot<ApiResponse> snapshot) {
          if (snapshot.data?.status == Status.LOADING) {
            return const CircularProgressIndicator();
          }
          if (snapshot.data?.status == Status.ERROR) {
            return Center(
              child: Text(snapshot.data!.message!),
            );
          }
          if (snapshot.data?.status == Status.SUCCESS) {
            return RefreshIndicator
              (child:  ListView.builder(
                itemCount: snapshot.data?.data!.length ,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 4) print("AAA ${snapshot.data?.data[index]}");

                  return Column(
                    children: [
                      NewsItem(
                        article: snapshot.data?.data[index],
                      ),
                      const Divider(thickness: 1.0),
                    ],
                  );
                }), onRefresh: _pullRefresh);
          }
          return Container();
        },
      ),
    );
  }


  Future<void> _pullRefresh() async {
    await _mainVM?.fetchNews();
    setState(() {
      _mainVM?.fetchNews();
    });

  }
}