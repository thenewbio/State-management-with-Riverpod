import 'package:flutter/foundation.dart' show immutable;
import 'package:lomj/state/constants/firebase_collection_name.dart';
import 'package:lomj/state/constants/firebase_field_name.dart';
import 'package:lomj/state/post/typedefs/user_id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    final userInfo = await FirebaseFirestore.instance
        .collection(FirebaseCollectionName.users)
        .where(FirebaseFieldName.userId, isEqualTo: userId)
        .limit(1)
        .get();
    if (userInfo.docs.isNotEmpty) {}
    await userInfo.docs.first.reference.update({
      FirebaseFieldName.displayName: displayName,
      FirebaseFieldName.email: email ?? "",
    });
    return true;
  }
}
