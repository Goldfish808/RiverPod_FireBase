import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/dto/chat/chat_req_dto.dart';

final chatFireStoreRespositoryProvider = Provider((ref) {
  return ChatFireStoreRepository();
});

class ChatFireStoreRepository {
  final db = FirebaseFirestore.instance;

  Future<DocumentReference> insert(ChatInsertReqDto dto) {
    return db.collection("chat").add(dto.toJson());
    //db.collection("chat").add(dto.toJson()).then((value) => null).onError((error, stackTrace) => null);
    // .then 잘 됐을 때, .onError 잘 안됐으면~
  }
}
