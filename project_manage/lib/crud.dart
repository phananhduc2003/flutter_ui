import 'dart:math';
import 'package:flutter/material.dart';

class SampleItem {
  String id;
  ValueNotifier<String> name;
  ValueNotifier<String> msv;
  ValueNotifier<String> phoneNumber;
  ValueNotifier<String> gender;

  SampleItem({
    String? id,
    required String name,
    required String msv,
    required String phoneNumber,
    required String gender,
  })  : id = id ?? generateUuid(),
        name = ValueNotifier(name),
        msv = ValueNotifier(msv),
        phoneNumber = ValueNotifier(phoneNumber),
        gender = ValueNotifier(gender);

  static String generateUuid() {
    return int.parse(
            '${DateTime.now().millisecondsSinceEpoch}${Random().nextInt(100000)}')
        .toRadixString(35)
        .substring(0, 9);
  }
}

class SampleItemViewModel extends ChangeNotifier {
  static final _instance = SampleItemViewModel._();
  factory SampleItemViewModel() => _instance;
  SampleItemViewModel._();

  final List<SampleItem> items = [];

  void addItem({
    required String name,
    required String msv,
    required String phoneNumber,
    required String gender,
  }) {
    items.add(SampleItem(
      name: name,
      msv: msv,
      phoneNumber: phoneNumber,
      gender: gender,
    ));
    notifyListeners();
  }

  void removeItem(String id) {
    items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateItem(String id, String newName, String newMsv,
      String newPhoneNumber, String newGender) {
    try {
      final item = items.firstWhere((item) => item.id == id);
      item.name.value = newName;
      item.msv.value = newMsv;
      item.phoneNumber.value = newPhoneNumber;
      item.gender.value = newGender;
      notifyListeners();
    } catch (e) {
      debugPrint("Không tìm thấy mục với ID $id");
    }
  }
}

class SampleItemUpdate extends StatefulWidget {
  final String? initialName;

  const SampleItemUpdate({Key? key, this.initialName}) : super(key: key);

  @override
  State<SampleItemUpdate> createState() => _SampleItemUpdateState();
}

class _SampleItemUpdateState extends State<SampleItemUpdate> {
  late TextEditingController nameController;
  late TextEditingController msvController;
  late TextEditingController phoneNumberController;
  late TextEditingController genderController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialName);
    msvController = TextEditingController();
    phoneNumberController = TextEditingController();
    genderController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    msvController.dispose();
    phoneNumberController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.initialName != null ? 'Chỉnh sửa' : 'Thêm mới',
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop({
                'name': nameController.text,
                'msv': msvController.text,
                'phoneNumber': phoneNumberController.text,
                'gender': genderController.text,
              });
            },
            icon: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Tên'),
            ),
            TextFormField(
              controller: msvController,
              decoration:
                  const InputDecoration(labelText: 'Mã sinh viên (MSV)'),
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Số điện thoại'),
            ),
            TextFormField(
              controller: genderController,
              decoration: const InputDecoration(labelText: 'Giới tính'),
            ),
          ],
        ),
      ),
    );
  }
}

class SampleItemWidget extends StatelessWidget {
  final SampleItem item;
  final VoidCallback? onTap;

  const SampleItemWidget({Key? key, required this.item, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ValueListenableBuilder<String>(
        valueListenable: item.name,
        builder: (context, value, child) {
          return Text(value);
        },
      ),
      subtitle: ValueListenableBuilder<String>(
        valueListenable: item.phoneNumber,
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Số điện thoại: $value'),
              Text('MSV: ${item.msv.value}'),
              Text('Giới tính: ${item.gender.value}'),
            ],
          );
        },
      ),
      leading: const CircleAvatar(
        foregroundImage: AssetImage('assets/images/flutter_logo.png'),
      ),
      onTap: onTap,
      trailing: const Icon(Icons.keyboard_arrow_right),
    );
  }
}

class SampleItemDetailsView extends StatefulWidget {
  final SampleItem item;

  const SampleItemDetailsView({Key? key, required this.item});

  @override
  State<SampleItemDetailsView> createState() => _SampleItemDetailsViewState();
}

class _SampleItemDetailsViewState extends State<SampleItemDetailsView> {
  final viewModel = SampleItemViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Student Information',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet<Map<String, String>>(
                context: context,
                builder: (context) => SampleItemUpdate(
                  initialName: widget.item.name.value,
                ),
              ).then((value) {
                if (value != null) {
                  viewModel.updateItem(
                    widget.item.id,
                    value['name']!,
                    value['msv']!,
                    value['phoneNumber']!,
                    value['gender']!,
                  );
                  setState(
                      () {}); // Cập nhật lại giao diện khi dữ liệu thay đổi
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Xác nhận xóa"),
                    content: const Text("Bạn có chắc muốn xóa mục này?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("Bỏ qua"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("Xóa"),
                      ),
                    ],
                  );
                },
              ).then((confirmed) {
                if (confirmed) {
                  viewModel.removeItem(widget.item.id);
                  Navigator.of(context).pop(true);
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<String>(
            valueListenable: widget.item.name,
            builder: (context, value, child) {
              return Text('Tên: $value');
            },
          ),
          ValueListenableBuilder<String>(
            valueListenable: widget.item.msv,
            builder: (context, value, child) {
              return Text('MSV: $value');
            },
          ),
          ValueListenableBuilder<String>(
            valueListenable: widget.item.phoneNumber,
            builder: (context, value, child) {
              return Text('Số điện thoại: $value');
            },
          ),
          ValueListenableBuilder<String>(
            valueListenable: widget.item.gender,
            builder: (context, value, child) {
              return Text('Giới tính: $value');
            },
          ),
        ],
      ),
    );
  }
}

class SampleItemListView extends StatefulWidget {
  const SampleItemListView({Key? key}) : super(key: key);

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  final viewModel = SampleItemViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Quản Lý Sinh Viên',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet<Map<String, String>>(
                context: context,
                builder: (context) => const SampleItemUpdate(),
              ).then((value) {
                if (value != null) {
                  viewModel.addItem(
                    name: value['name']!,
                    msv: value['msv']!,
                    phoneNumber: value['phoneNumber']!,
                    gender: value['gender']!,
                  );
                }
              });
            },
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          return ListView.builder(
            itemCount: viewModel.items.length,
            itemBuilder: (context, index) {
              final item = viewModel.items[index];
              return SampleItemWidget(
                key: ValueKey(item.id),
                item: item,
                onTap: () {
                  Navigator.of(context)
                      .push<bool>(
                    MaterialPageRoute(
                      builder: (context) => SampleItemDetailsView(item: item),
                    ),
                  )
                      .then((deleted) {
                    if (deleted ?? false) {
                      viewModel.removeItem(item.id);
                    }
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}
