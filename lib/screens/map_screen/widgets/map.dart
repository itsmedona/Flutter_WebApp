import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key, required this.mappath, required this.zoom})
      : super(key: key);
  final String mappath;
  final bool zoom;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  _MapWidgetState();

  late List<Model> _data;
  late MapShapeSource _mapSource;

  @override
  void initState() {
    _data = const <Model>[
      Model('New South Wales', AppColors.buttontextColor,
          '       New\nSouth Wales'),
      Model('Queensland', AppColors.darkTextColor, 'Queensland'),
      Model('Northern Territory', Color.fromRGBO(255, 78, 66, 1.0),
          'Northern\nTerritory'),
      Model('Victoria', AppColors.buttontextColor, 'Victoria'),
      Model('South Australia', AppColors.buttontextColor, 'South Australia'),
      Model('Western Australia', AppColors.darkTextColor, 'Western Australia'),
      Model('Tasmania', AppColors.buttontextColor, 'Tasmania'),
      Model('Australian Capital Territory', AppColors.darkTextColor, 'ACT')
    ];

    _mapSource = MapShapeSource.asset(
      widget.mappath,
      shapeDataField: 'STATE_NAME',
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].state,
      dataLabelMapper: (int index) => _data[index].stateCode,
      shapeColorValueMapper: (int index) => _data[index].color,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfMaps(
      layers: <MapShapeLayer>[
        MapShapeLayer(
          zoomPanBehavior: widget.zoom ? MapZoomPanBehavior() : null,
          source: _mapSource,
          showDataLabels: true,
          legend: const MapLegend(MapElement.shape),
          tooltipSettings: MapTooltipSettings(
              color: Colors.grey[700],
              strokeColor: Colors.white,
              strokeWidth: 2),
          strokeColor: Colors.white,
          strokeWidth: 0.5,
          shapeTooltipBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _data[index].stateCode,
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
          dataLabelSettings: MapDataLabelSettings(
            textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize),
          ),
        ),
      ],
    );
  }
}

/// Collection of Australia state code data.
class Model {
  const Model(
    this.state,
    this.color,
    this.stateCode,
  );
  final String state;
  final Color color;
  final String stateCode;
}

class WorldMapWidget extends StatefulWidget {
  const WorldMapWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<WorldMapWidget> createState() => _WorldMapWidgetState();
}

class _WorldMapWidgetState extends State<WorldMapWidget> {
  _WorldMapWidgetState();

  late List<WorldWonderModel> _data;
  late MapShapeSource _shapeSource;

  @override
  void initState() {
    super.initState();

    _data = <WorldWonderModel>[
      const WorldWonderModel(
          place: 'Chichen Itza',
          country: 'Mexico',
          latitude: 20.6843,
          longitude: -88.5678),
      const WorldWonderModel(
          place: 'Machu Picchu',
          country: 'Peru',
          latitude: -13.1631,
          longitude: -72.5450),
      const WorldWonderModel(
          place: 'Christ the Redeemer',
          country: 'Brazil',
          latitude: -22.9519,
          longitude: -43.2105),
      const WorldWonderModel(
          place: 'Colosseum',
          country: 'Rome',
          latitude: 41.8902,
          longitude: 12.4922),
      const WorldWonderModel(
          place: 'Petra',
          country: 'Jordan',
          latitude: 30.3285,
          longitude: 35.4444),
      const WorldWonderModel(
          place: 'Taj Mahal',
          country: 'India',
          latitude: 27.1751,
          longitude: 78.0421),
      const WorldWonderModel(
          place: 'Great Wall of China',
          country: 'China',
          latitude: 40.4319,
          longitude: 116.5704)
    ];

    _shapeSource = const MapShapeSource.asset(
      "assets/maps/worldmap.json",
      shapeDataField: "country",
    );
  }

  @override
  Widget build(BuildContext context) {
    return SfMaps(
      layers: [
        MapShapeLayer(
          zoomPanBehavior: MapZoomPanBehavior(),
          source: _shapeSource,
          initialMarkersCount: _data.length,
          markerBuilder: (BuildContext context, int index) {
            return MapMarker(
              latitude: _data[index].latitude,
              longitude: _data[index].longitude,
              child: const Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
            );
          },
          markerTooltipBuilder: (BuildContext context, int index) {
            return Container(
              width: 150,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          _data[index].country,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .fontSize),
                        ),
                      ),
                      const Icon(
                        Icons.tour,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 10,
                    thickness: 1.2,
                  ),
                  Text(
                    _data[index].place,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            Theme.of(context).textTheme.bodyText2!.fontSize),
                  ),
                ],
              ),
            );
          },
          tooltipSettings: const MapTooltipSettings(
              color: Colors.blueAccent,
              strokeColor: Colors.black,
              strokeWidth: 1.5),
        ),
      ],
    );
  }
}

/// Collection of World map data.
class WorldWonderModel {
  const WorldWonderModel(
      {required this.place,
      required this.country,
      required this.latitude,
      required this.longitude});

  final String place;
  final String country;
  final double latitude;
  final double longitude;
}
