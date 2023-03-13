import 'dart:convert';

import 'package:ai_image_generator/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageListView extends StatefulWidget {
  @override
  _ImageListViewState createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  List<Datum> _images = [];

  @override
  void initState() {
    super.initState();
    _getImages();
  }

  Future<void> _getImages() async {
    final response = await http.post(
      Uri.parse('https://open-ai-image.codinghood.in/api/create-ai-image'),
      body: json.encode({
        'message': 'Pizza insider burger',
        'numberOfImages': 5,
        'size': 'sm',
      }),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final data = ImageModel.fromJson(json.decode(response.body));
      setState(() {
        _images = data.images!.data!;
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Images')),
      body: ListView.builder(
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _images[index];
          return Image.network(image.url ?? "");
        },
      ),
    );
  }
}
