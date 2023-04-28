import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo_app/app/models/message_model.dart';
import 'package:shamo_app/app/models/product_model.dart';
import 'package:shamo_app/app/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesByUserId({int? userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.created_at!.compareTo(b.created_at!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage(
      {UserModel? user,
      bool? isFromUser,
      String? message,
      ProductModel? product}) async {
    try {
      firestore.collection("messages").add({
        'userId': user!.id,
        'userName': user!.name,
        'userImage': user!.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product':
            product is UninitializedProductModel ? {} : product!.toJson(),
        'created_at': DateTime.now().toString(),
        'updated_at': DateTime.now().toString(),
      }).then((value) => print("Pesan Berhasil Dikirim"));
    } catch (e) {
      throw Exception("Pesan Gagal Dikirim.");
    }
  }
}
