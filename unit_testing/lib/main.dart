import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:province/models/povince.dart';

import 'models/district.dart';

import 'models/ward.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Province? selectedProvince;
  District? selectedDistrict;
  Ward? selectedWard;

  List<Province> provinceList = [];
  List<District> districtList = [];
  List<Ward> wardList = [];

  @override
  void initState() {
    super.initState();
    loadLocationData();
  }

  Future<void> loadLocationData() async {
    try {
      String data = await rootBundle.loadString('assets/don_vi_hanh_chinh.json');
      Map<String, dynamic> jsonData = json.decode(data);
      List<dynamic> provinceData = jsonData['province'];
      provinceList = provinceData.map((json) => Province.fromMap(json)).toList();
      List<dynamic> districtData = jsonData['district'];
      districtList = districtData.map((json) => District.fromMap(json)).toList();
      List<dynamic> wardData = jsonData['ward'];
      wardList = wardData.map((json) => Ward.fromMap(json)).toList();
    } catch (e) {
      debugPrint('Error loading location data: $e');
    }
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Địa chỉ'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Province>(
              hint: Text('Tỉnh'),
              value: selectedProvince,
              onChanged: (Province? newValue) {
                setState(() {
                  selectedProvince = newValue;
                  selectedDistrict = null;
                  
                });
              },
              items: provinceList.map<DropdownMenuItem<Province>>((Province province) {
                return DropdownMenuItem<Province>(
                  value: province,
                  child: Text(province.name ?? ''),
                );
              }).toList(),
            ),
          ),
          if (selectedProvince != null) 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<District>(
                hint: Text('Thành phố'),
                value: selectedDistrict,
                onChanged: (District? newValue) {
                  setState(() {
                    selectedDistrict = newValue;
                  });
                },
                items: districtList.where((district) => district.provinceId == selectedProvince!.id).map<DropdownMenuItem<District>>((District district) {
                  return DropdownMenuItem<District>(
                    value: district,
                    child: Text(district.name ?? ''),
                  );
                }).toList(),
              ),
            ),
          
          if (selectedDistrict != null) 
            Padding(
  padding: const EdgeInsets.all(8.0),
  child: DropdownButton<Ward>(
    hint: Text('Select Ward'),
    value: selectedWard,
    onChanged: (Ward? newValue) {
      setState(() {
        selectedWard = newValue;
      });
      
    },
    items: wardList.where((ward) => ward.districtId == selectedDistrict!.id).map<DropdownMenuItem<Ward>>((Ward ward) {
      return DropdownMenuItem<Ward>(
        value: ward,
        child: Text(ward.name ?? ''),
      );
    }).toList(),
  ),
),

        ],
      ),
    );
  }
}
