import 'package:flutter/material.dart';
class PageModel {
  String _images;
  String _title;
  String _description;
  IconData _icons;

  PageModel(this._images, this._title, this._description, this._icons);

  IconData get icons => _icons;

  String get description => _description;

  String get title => _title;

  String get images => _images;
}
