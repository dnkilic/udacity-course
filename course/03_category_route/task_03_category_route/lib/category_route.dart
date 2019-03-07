// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:task_03_category_route/category.dart';

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
///

final _appBarTitle = "Unit Converter";
final _appBarTitleSize = 30.0;
final _appBarElevation = 0.0;

class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static final _size = _categoryNames.length;

  @override
  Widget build(BuildContext context) {
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.

    List<Category> items = List<Category>.generate(
        _categoryNames.length,
        (i) => Category(
            name: _categoryNames[i],
            color: _baseColors[i],
            iconLocation: Icons.cake));

    final listView = Container(
      color: Colors.green[100],
      child: ListView.builder(
          itemCount: _size,
          itemBuilder: (context, index) {
            final item = items[index];
            return item;
          }),
    );

    final appBar = AppBar(
      title: Title(
        color: Colors.black,
        child: Center(child: Text(_appBarTitle)),
      ),
      textTheme: TextTheme(
          title: TextStyle(fontSize: _appBarTitleSize, color: Colors.black)),
      elevation: _appBarElevation,
      backgroundColor: Colors.green[100],
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
