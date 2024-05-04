import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/src/features/shop/model/cart_item_model.dart';
import 'package:e_commerce_app/src/utils/contants/enums.dart';
import 'package:e_commerce_app/src/utils/helpers/helper_functions.dart';

import 'address_model.dart';


class OrderModel {
 final String id;
 final String userId;
 final OrderStatus status;
 final double totalAmount;
 final DateTime orderDate;
 final String paymentMethod;
 final AddressModel? address;
 final DateTime? deliveryyDate;
 final List<CartItemModel> items;


 OrderModel({
   required this.id,
   this.userId = '',
   required this.status,
   required this.items,
   required this.totalAmount,
   required this.orderDate,
   this.paymentMethod = 'Paypal',
   this.address,
   this.deliveryyDate,
});

 String get formattedOrderDate => danHelperFunction.getFormattedDate(orderDate);

 String get formattedDeliveryDat => deliveryyDate != null ? danHelperFunction.getFormattedDate(deliveryyDate!) : '';


 String get orderStatusText => status == OrderStatus.delivered ? 'Delivered' : status == OrderStatus.shipped ? 'Shipment on the way' : 'Processing';


 Map<String, dynamic> toJson() {
   return {
     'id': id,
     'userId': userId,
     'status': status.toString(),
     'totalAmount': totalAmount,
     'orderDate': orderDate,
     'paymentMethod': paymentMethod,
     'address': address?.toJson(),
     'deliveryDate': deliveryyDate,
     //// the below takes each item and maps them into the cartModel ---------video 52----- 27:13
     'items': items.map((item) => item.toJson()).toList(), // convert cartModel to map
   };
 }
 
 factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
   final data = snapshot.data() as Map<String, dynamic>;
   
   return OrderModel(
     id: data['id'] as String,
     userId: data['userId'] as String,
     status: OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
     totalAmount: data['totalAmount'] as double,
     orderDate: (data['orderDate'] as Timestamp).toDate(),
     paymentMethod: data['paymentMethod'] as String,
     address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
     deliveryyDate: data['deliveryDate'] == null ? null : (data['deliveryDate'] as Timestamp).toDate(),
     items: (data['items'] as List<dynamic>).map((itemData) => CartItemModel.fromJson(itemData as Map<String, dynamic>)).toList(),
   );
 }




}