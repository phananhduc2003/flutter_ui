
import 'package:flutter_test/flutter_test.dart';
import 'package:province/models/addressinfo.dart';
import 'package:province/models/district.dart';
import 'package:province/models/povince.dart';
import 'package:province/models/ward.dart';


void main() {
  AddressInfo? addressInfo;

  group('AddressInfo', () {
    test('Test AddressInfo', () {
      addressInfo = AddressInfo(
        province: Province(
          id: "01",
          name: "Thành phố Hà Nội",
          level: "Thành phố Trung ương",
        ),
        district: District(
          id: "001",
          name: "Quận Ba Đình",
          level: "Quận",
          provinceId: "01",
        ),
        ward: Ward(
          id: "00001",
          name: "Phường Phúc Xá",
          level: "Phường",
          districtId: "001",
          provinceId: "01",
        ),
        street: "123 Đường ABC",
      );

      expect(addressInfo?.province?.id, "01");
      expect(addressInfo?.province?.name, "Thành phố Hà Nội");
      expect(addressInfo?.province?.level, "Thành phố Trung ương");

      expect(addressInfo?.district?.id, "001");
      expect(addressInfo?.district?.name, "Quận Ba Đình");
      expect(addressInfo?.district?.level, "Quận");

      expect(addressInfo?.ward?.id, "00001");
      expect(addressInfo?.ward?.name, "Phường Phúc Xá");
      expect(addressInfo?.ward?.level, "Phường");

      expect(addressInfo?.street, "123 Đường ABC");
    });
  });
}
