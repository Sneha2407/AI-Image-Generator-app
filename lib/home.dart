import 'package:ai_image_generator/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titlecontroller = TextEditingController();
  final sizeController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProv>(context, listen: false);
    titlecontroller.text = "";
    sizeController.text = "sm";
    numberController.text = "0";
    return Scaffold(
      appBar: AppBar(title: Text("AI Image Generator"), actions: []),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Text("Welcome to AI Image Generator"),
            SizedBox(height: 20),
            TextFormField(
              //disable textformfield
              // enabled: false,
              controller: titlecontroller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: "Search your imagination",
              ),
              onChanged: (value) {
                setState(() {
                  print("typing new main goal ===>>> $value");
                });
              },
            ),
            TextFormField(
              //disable textformfield
              // enabled: false,
              controller: sizeController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: "Enter size (sm/me/lg)",
              ),
            ),
            TextFormField(
              //disable textformfield
              // enabled: false,
              controller: titlecontroller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: "Enter number",
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: Text("Search"),
                onPressed: () {
                  final imageProvider =
                      Provider.of<ImageProv>(context, listen: false);
                  imageProvider.createImage(
                      title: "dog flying", size: "sm", number: 10);
                },
              ),
            ),
            // ListView.builder(
            //   itemCount: imageProvider.imageModel.images!.data.length,
            //   itemBuilder: (context, index) {
            //     // Datum datum = imageProvider.imageModel.images!.data[index];
            //     return Container(
            //         height: 200,
            //         width: double.infinity,
            //         child: Image.network(imageProvider.imageModel.images!.data[index].url));
            //   },
            // )
            Flexible(
              child: ListView.builder(
                itemCount: imageProvider.imageModel.images?.data?.length ?? 3,
                itemBuilder: (context, index) {
                  if (imageProvider.imageModel == null ||
                      imageProvider.imageModel.images == null ||
                      imageProvider.imageModel.images!.data == null) {
                    return SizedBox.shrink(); // or any other fallback widget
                  }
                  return Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                        imageProvider.imageModel.images!.data![index].url ??
                            ""),
                  );
                },
              ),
            )
            // ListView.builder(itemBuilder: itemBuilder)
          ]),
        ),
      ),
    );
  }
}
