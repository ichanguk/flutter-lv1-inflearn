import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CameraPosition initialPosition = CameraPosition(
    target: LatLng(37.5214, 126.9246),
    zoom: 15,
  );

  bool choolCheckDone = false;
  bool canChoolCheck = false;

  final double okDistance = 100;

  late final GoogleMapController controller;

  @override
  void initState() {
    super.initState();

    Geolocator.getPositionStream().listen((event) {
      final start = LatLng(37.5214, 126.9246);
      final end = LatLng(event.latitude, event.longitude);

      final distance = Geolocator.distanceBetween(
        start.latitude,
        start.longitude,
        end.latitude,
        end.longitude,
      );

      setState(() {
        if (distance > okDistance) {
          canChoolCheck = false;
        } else {
          canChoolCheck = true;
        }
      });
    });
  }

  checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      throw Exception('위치 기능을 활성화 해주세요.');
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();

    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();
    }

    if (checkedPermission != LocationPermission.always &&
        checkedPermission != LocationPermission.whileInUse) {
      throw Exception('위치 권한을 허가해주세요');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '오늘도 출근',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: myLocationPressed,
            icon: Icon(Icons.my_location),
            color: Colors.blue,
          ),
        ],
      ),
      body: FutureBuilder(
        future: checkPermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: _GoogleMaps(
                  initialCameraPosition: initialPosition,
                  onMapCreated: (GoogleMapController controller) {
                    this.controller = controller;
                  },
                  okDistance: okDistance,
                  canChoolCheck: canChoolCheck,
                ),
              ),
              Expanded(
                child: _BottomChoolCheckButton(
                  canChoolCheck: canChoolCheck,
                  choolCheckDone: choolCheckDone,
                  choolCheckPressed: choolCheckPressed,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  choolCheckPressed() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('출근하기'),
          content: Text('출근을 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              child: Text('출근하기'),
            ),
          ],
        );
      },
    );

    if (result) {
      setState(() {
        choolCheckDone = result;
      });
    }
  }

  myLocationPressed() async {
    final location = await Geolocator.getCurrentPosition();

    controller.animateCamera(
      CameraUpdate.newLatLng(LatLng(location.latitude, location.longitude)),
    );
  }
}

class _GoogleMaps extends StatelessWidget {
  final CameraPosition initialCameraPosition;
  final MapCreatedCallback onMapCreated;
  final double okDistance;
  final bool canChoolCheck;

  const _GoogleMaps({
    super.key,
    required this.initialCameraPosition,
    required this.onMapCreated, required this.okDistance, required this.canChoolCheck,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: onMapCreated,
      markers: {
        Marker(markerId: MarkerId('123'), position: LatLng(37.5214, 126.9246)),
      },
      circles: {
        Circle(
          circleId: CircleId('inDistance'),
          center: LatLng(37.5214, 126.9246),
          radius: okDistance,
          fillColor:
              canChoolCheck
                  ? Colors.blue.withValues(alpha: 0.5)
                  : Colors.red.withValues(alpha: 0.5),
          strokeColor: canChoolCheck ? Colors.blue : Colors.red,
          strokeWidth: 1,
        ),
      },
    );
  }
}

class _BottomChoolCheckButton extends StatelessWidget {
  final bool choolCheckDone;
  final bool canChoolCheck;
  final VoidCallback choolCheckPressed;
  const _BottomChoolCheckButton({super.key, required this.choolCheckDone, required this.canChoolCheck, required this.choolCheckPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          choolCheckDone ? Icons.check : Icons.timelapse_outlined,
          color: choolCheckDone ? Colors.green : Colors.blue,
        ),
        SizedBox(height: 16.0),
        if (!choolCheckDone && canChoolCheck)
          OutlinedButton(
            onPressed: choolCheckPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            child: Text('출근하기'),
          ),
      ],
    );
  }
}
