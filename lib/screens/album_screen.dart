import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/album_model.dart';
import '../provider/album_provider.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late List<Album> albumList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Album List"),
      ),
      body: Consumer<AlbumProvider>(builder: (context, provider, child) {
        albumList = provider.getAlbumList();
        return ListView.builder(
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "${albumList[index].id}: ${albumList[index].title}",
                ),
              );
            });
      }),
    );
  }
}
