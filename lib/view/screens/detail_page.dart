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
          color: Color(0xffDDE6ED),
        ),
        backgroundColor: const Color(0xff27374D),
      ),
      backgroundColor: const Color(0xff526D82),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(3, 3), blurRadius: 5, color: Colors.grey)
                ],
                image: DecorationImage(
                    image: NetworkImage(
                      data['previewURL'],
                    ),
                    fit: BoxFit.fill)),
            height: h * 0.6,
            width: double.infinity,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            (!favWallpaper.contains(data))
                ? favWallpaper.add(data)
                : favWallpaper.remove(data);
          },
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          label: const Text("Add to favourite")),
    );
  }
}
