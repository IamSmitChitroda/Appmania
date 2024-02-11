import 'package:flutter/material.dart';
import 'package:wallpaper_app/utills/all_wallpaper_utills.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          data['tags'],
          style: const TextStyle(color: Color(0xffDDE6ED)),
        ),
        //BouttonForPop
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_sharp),
          color: const Color(0xffDDE6ED),
        ),
        backgroundColor: const Color(0xff27374D),
      ),
      backgroundColor: const Color(0xff526D82),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 5,
                          color: Colors.grey)
                    ],
                    image: DecorationImage(
                        image: NetworkImage(
                          data['previewURL'],
                        ),
                        fit: BoxFit.fill)),
                height: h * 0.6,
                width: double.infinity,
              ),
              const SizedBox(
                height: 15,
                width: double.infinity,
              ),
              Container(
                height: h * 0.38,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xff9DB2BF),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 5,
                        color: Colors.grey,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Tags: ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data['tags'],
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Width : ${data['previewWidth']}",
                      ),
                      Text(
                        "Height : ${data['previewHeight']}",
                      ),
                      Text(
                        "webformatWidth : ${data['webformatWidth']}",
                      ),
                      Text(
                        "webformatHeight : ${data['webformatHeight']}",
                      ),
                      Text(
                        "imageWidth : ${data['imageWidth']}",
                      ),
                      Text(
                        "imageHeight : ${data['imageHeight']}",
                      ),
                      Text(
                        "imageSize : ${data['imageSize']}",
                      ),
                      Text(
                        "views : ${data['views']}",
                      ),
                      Text(
                        "downloads : ${data['downloads']}",
                      ),
                      Text(
                        "collections : ${data['collections']}",
                      ),
                      Text(
                        "likes : ${data['likes']}",
                      ),
                      Text(
                        "comments : ${data['comments']}",
                      ),
                      Text(
                        "user_id : ${data['user_id']}",
                      ),
                      Text(
                        "user : ${data['user']}",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (!favWallpaper.contains(data)) {
              favWallpaper.add(data);
              var snackBar = const SnackBar(
                content: Text("Add In favourite"),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              favWallpaper.remove(data);
              var snackBar = const SnackBar(
                content: Text("Remove From favourite"),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          label: const Text("Add to favourite")),
    );
  }
}
