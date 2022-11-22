import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/contoller/chat_controller.dart';
import 'package:riverpod_firestore_steam1/dto/chat/chat_req_dto.dart';

class ChatRoomPage extends ConsumerWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatController = ref.read(chatControllerProvider);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Random random = Random();
          ChatInsertReqDto dto = ChatInsertReqDto(
            from: "ssar",
            to: "cos",
            msg: "hello - ${random.nextInt(100)}",
          );
          chatController.insert(dto);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.separated(
      itemCount: 2,
      itemBuilder: (context, index) => ListTile(
        title: Text("msg : 안녕?"),
        subtitle: Text("from : ssar"),
      ),
      separatorBuilder: (context, index) => Divider(),
    );
  }

  AppBar _buildAppBar() => AppBar(title: Text("riverpod & firestore & stream"));
}
