import 'package:flutter_test/flutter_test.dart';
import 'package:province/models/district.dart';

void main() {
  District? district;
  group('District', () {
    test('test District', () {
      var district = District(id: "01", name: "Thành phố Hà Nội", level: "Thành phố Trung ương", provinceId: "01");
      expect(district.id, "01");
      expect(district.name, "Thành phố Hà Nội");
      expect(district.level, "Thành phố Trung ương");
    });
  });
  group('Test District:', () {
    setUp(() {
      district = District(
        id: "01",
        name: "Thành phố Hà Nội",
        level: "Thành phố Trung ương",
      );
    });

    test('test Province?', () {
      expect(district?.id, equals("01"));
      expect(district?.name, equals("Thành phố Hà Nội"));
      expect(district?.level, equals("Thành phố Trung ương"));
    });
  });
}
