import 'package:flutter_test/flutter_test.dart';
import 'package:province/models/ward.dart';

void main() {
  Ward? ward;

  group('Ward', () {
    test('test Ward', () {
      var ward = Ward(
        id: "01",
        name: "Kinh Bắc",
        level: "Thành phố Trung ương",
        districtId: "03",
        provinceId: "01",
      );
      expect(ward.id, "01");
      expect(ward.name, "Kinh Bắc");
      expect(ward.level, "Thành phố Trung ương");
      expect(ward.districtId, "03");
      expect(ward.provinceId, "01");
    });
  });
  group('test Ward:', () {
    setUp(
      () {
        ward = Ward(
          id: "01",
          name: "Kinh Bắc",
          level: "Thành phố Trung ương",
          districtId: "03",
          provinceId: "01",
        );
      }
    );
    test('test Ward?',(){
       expect(ward?.id, equals("01"));
      expect(ward?.name, equals("Kinh Bắc"));
      expect(ward?.level, equals("Thành phố Trung ương"));
      expect(ward?.districtId, equals("03"));
      expect(ward?.provinceId, equals("01"));
    });
  });
}
