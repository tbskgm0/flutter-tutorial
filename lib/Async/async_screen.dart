import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class AsyncScreen extends StatefulWidget {
  const AsyncScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AsyncScreen();
}

class _AsyncScreen extends State<AsyncScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String birthday = '';
  int age = -1;

  @override
  void initState() {
    super.initState();
    _checkUserData();
  }

  Future<void> _setData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(
      () {
        prefs
          ..setString('name', name)
          ..setString('birthday', birthday)
          ..setInt('age', age);
      },
    );
  }

  Future<void> _checkUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '未設定';
      age = prefs.getInt('age') ?? -1;
      birthday = prefs.getString('birthday') ?? '未設定';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      body: _buildInformationSection(context),
      floatingActionButton: _buildFloatingAction(),
    );
  }

  Widget _buildInformationSection(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('名前 $name'),
          Text('年齢 ${age < 0 ? "未設定" : age}'),
          Text('誕生日 $birthday'),
        ],
      ),
    );
  }

  // FloatingAction
  Widget _buildFloatingAction() {
    return FloatingActionButton(
      onPressed: () {
        log('Floating action button is tapped.');
        _showDialog(context);
      },
      backgroundColor: Colors.green,
      child: const Icon(Icons.add),
    );
  }

  Future _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('登録'),
          content: SizedBox(
            height: 250,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: '名前'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: '年齢'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      age = int.parse(value);
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: '誕生日'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      birthday = value;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pop(context);
                              _setData();
                            }
                          },
                          child: const Text('保存'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
