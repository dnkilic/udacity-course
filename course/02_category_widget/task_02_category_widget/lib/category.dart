// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).

  final _rowHeight = 100.0;

  //final _borderRadius = BorderRadius.circular(_rowHeight / 2);
  final Color color;
  final String name;
  final IconData iconLocation;

  const Category(
      {Key key,
      @required this.name,
      @required this.iconLocation,
      @required this.color})
      : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        super(key: key);

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: _rowHeight,
          child: Material(
            color: color,
            child: InkWell(
              radius: 50.0,
              customBorder: Border(top: BorderSide(color: color, width: 10.0)),
              splashColor: color,
              onTap: () {
                print('Tapped');
              },
              child: Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(iconLocation, size: 60.0),
                ),
                Center(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 24.0),
                  ),
                )
              ]),
            ),
          )),
    );
  }
}
