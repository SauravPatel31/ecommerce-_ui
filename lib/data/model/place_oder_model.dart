class PlaceOrderModel {
  bool? status;
  String? message;
  List<Orders>? orders;

  PlaceOrderModel({this.status, this.message, this.orders});

  PlaceOrderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }


}

class Orders {
  int? id;
  String? totalAmount;
  String? orderNumber;
  String? status;
  String? createdAt;
  List<Product>? product;

  Orders(
      {this.id,
        this.totalAmount,
        this.orderNumber,
        this.status,
        this.createdAt,
        this.product});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalAmount = json['total_amount'];
    orderNumber = json['order_number'];
    //status = json['status'];
    createdAt = json['created_at'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }


}

class Product {
  int? id;
  String? name;
  int? quantity;
  String? price;
  String? image;

  Product({this.id, this.name, this.quantity, this.price, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
