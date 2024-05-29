import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'nguoi_dung.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get label => null;

  bool isBusy = false;

  Future<void> createData() async {
    setState(() {
      isBusy = true;
    });
    // ignore: unused_local_variable
    final now = DateTime.now();
    final nguoiDung = NguoiDung(
      name: 'Nguyễn Văn Huy',
      age: 20,
      email: 'huynnguyen26@gmail.com',
    );
    await FirebaseFirestore.instance.collection('users').add(nguoiDung.toMap());
    setState(() {
      isBusy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Firebase Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
                onPressed: createData,
                icon: const Icon(Icons.add),
                label: const Text('Create (Thêm dữ liệu)'))
          ],
        ),
      ),
    );
  }
}
