import 'package:shamo_app/app/models/product_model.dart';

class MessageModel {
  String? message;
  int? userId;
  String? userName;
  String? userImage;
  bool? isFromUser;
  ProductModel? product;
  DateTime? created_at;
  DateTime? updated_at;

  MessageModel(
      {this.message,
      this.userId,
      this.userName,
      this.userImage,
      this.isFromUser,
      this.product,
      this.created_at,
      this.updated_at});

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];
    product = json['product'] == {}
        ? UninitializedProductModel()
        : ProductModel.fromJson(json['product']);
    created_at = DateTime.parse(json['created_at']);
    updated_at = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'product': product is UninitializedProductModel ? {} : product!.toJson(),
      'created_at': created_at.toString(),
      'updated_at': updated_at.toString(),
    };
  }
}
