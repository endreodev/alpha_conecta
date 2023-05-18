import 'package:flutter/material.dart';

class PageNotFolder extends StatefulWidget {
  const PageNotFolder({super.key});

  @override
  State<PageNotFolder> createState() => _PageNotFolderState();
}

class _PageNotFolderState extends State<PageNotFolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 - PAGINAL ENCONTRADA'),
      ),
      body: const Center(
        child: Text('404 - PAGINAL ENCONTRADA'),
      ),
    );
  }
}
