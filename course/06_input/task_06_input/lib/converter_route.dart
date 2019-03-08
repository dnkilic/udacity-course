// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0);
const _iconSize = 40.0;

/// [ConverterRoute] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// This [Category]'s name.
  final String name;

  /// Color for this [Category].
  final Color color;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the name, color, and units to not be null.
  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  String value;
  String units;

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  @override
  Widget build(BuildContext context) {
    final unitWidgets = widget.units.map((Unit unit) {
      return DropdownMenuItem(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text(
                unit.name,
                style: Theme.of(context).textTheme.headline,
              ),
            ],
          ),
        ),
      );
    }).toList();

    Widget input = Padding(
      padding: _padding,
      child: Column(children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Input",
              errorStyle: TextStyle(color: Colors.red)),
        ),
        DropdownButtonFormField(
          items: unitWidgets,
          onChanged: (value) {},
        )
      ]),
    );

    Icon icon = Icon(Icons.compare_arrows, size: _iconSize);

    Widget output = Padding(
      padding: _padding,
      child: Column(children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Output",
              errorStyle: TextStyle(color: Colors.red)),
        ),
        DropdownButtonFormField(
          items: unitWidgets,
          onChanged: (value) {},
        )
      ]),
    );
    return Padding(
      padding: _padding,
      child: Column(children: <Widget>[input, icon, output]),
    );
  }
}
