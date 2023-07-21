import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'model.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  List<ServiceModel>? _getsList;
  bool _isUploaded = true;

  void changeStatus() {
    setState(() {
      _isUploaded = !_isUploaded;
    });
  }

  @override
  void initState() {
    super.initState();
    fechItems();
  }

  Future<void> fechItems() async {
    changeStatus();
    final response = await Dio()
        .get("https://jsonplaceholder.typicode.com/posts/1/comments");
    if (response.statusCode == HttpStatus.ok) {
      final datas = response.data;
      if (datas is List) {
        _getsList = datas.map((e) => ServiceModel.fromJson(e)).toList();
      }
    } else {
      debugPrint("eror");
    }

    changeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isUploaded
              ? SizedBox.shrink()
              : CircularProgressIndicator.adaptive()
        ],
      ),
      body: ListView.builder(
        itemCount: _getsList?.length ?? 0,
        itemBuilder: (context, index) {
          return myListTile(serviceModel: _getsList?[index]);
        },
      ),
    );
  }
}

class myListTile extends StatelessWidget {
  const myListTile({
    super.key,
    required serviceModel,
  }) : _serviceModel = serviceModel;

  final ServiceModel _serviceModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        (_serviceModel.name ?? "bos"),
      ),
      subtitle: Text(_serviceModel.email ?? "bos"),
    );
  }
}
