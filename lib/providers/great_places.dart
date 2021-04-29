import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:great_places/models/places.dart';
import 'package:great_places/utils/db_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  int get itemsCount => _items.length;

  Place itemByIndex(int index) => _items[index];

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData("places");
    _items = dataList
        .map(
          (item) => Place(
            id: item["id"],
            title: item["title"],
            image: File(item["image"]),
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );
    _items.add(newPlace);

    DbUtil.insert("places", {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path,
    });

    notifyListeners();
  }
}
