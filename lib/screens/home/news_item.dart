import 'package:daryo_app/screens/home/details/details_page.dart';
import 'package:flutter/material.dart';
import '../../models/news_response.dart';

class NewsItem extends StatelessWidget {
   final Articles article;

   const NewsItem({Key? key, required this.article,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Dunyo",
                style:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '${article.publishedAt} ',
                    style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                  Icon(
                    Icons.visibility,
                    color: Colors.blue[300],
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                 const Text("600",
                      style:
                      TextStyle(color: Colors.blue, fontSize: 12.0))
                ],
              )
            ],
          ),
          const SizedBox(height: 8.0),
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailsPage(article: article,)));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(article.urlToImage ?? "https://cdn.vox-cdn.com/thumbor/qVjMPtyFVT5Dtwl_jSOCj4Y33TM=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/15980837/elon_musk_tesla_3036.jpg", width: 120, height: 80),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                   article.title!,
                    style:
                    const TextStyle(fontWeight: FontWeight.w500, height: 1.2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}