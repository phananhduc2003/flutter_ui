import 'package:flutter_test/flutter_test.dart';
import 'package:province/models/addressinfo.dart';
import 'package:province/models/district.dart';
import 'package:province/models/povince.dart';
import 'package:province/models/userInfo.dart';
import 'package:province/models/ward.dart';

void main() {
  UserInfo? userInfo;

  group('UserInfo', () {
    test('Test UserInfo', () {
      userInfo = UserInfo(
        name: "Pham Van A",
        email: "phamA@gmail.com",
        phoneNumber: "123456789",
        birthDate: DateTime(1999, 5, 20),
        address: AddressInfo(
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
        ),
      );

      expect(userInfo?.name, "Pham Van A");
      expect(userInfo?.email, "phamA@gmail.com");
      expect(userInfo?.phoneNumber, "123456789");
      expect(userInfo?.birthDate, DateTime(1999, 5, 20));

      expect(userInfo?.address?.province?.id, "01");
      expect(userInfo?.address?.province?.name, "Thành phố Hà Nội");
      expect(userInfo?.address?.province?.level, "Thành phố Trung ương");

      expect(userInfo?.address?.district?.id, "001");
      expect(userInfo?.address?.district?.name, "Quận Ba Đình");
      expect(userInfo?.address?.district?.level, "Quận");

      expect(userInfo?.address?.ward?.id, "00001");
      expect(userInfo?.address?.ward?.name, "Phường Phúc Xá");
      expect(userInfo?.address?.ward?.level, "Phường");

      expect(userInfo?.address?.street, "123 Đường ABC");
    });
  });
}
