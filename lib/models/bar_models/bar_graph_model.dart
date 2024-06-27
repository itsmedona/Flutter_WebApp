import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/models/bar_models/graph_model.dart';

class BarGraphModel {
  String lable;
  Color color;
  List<GraphModel> graph;

  BarGraphModel(
      {required this.lable, required this.color, required this.graph});
}
