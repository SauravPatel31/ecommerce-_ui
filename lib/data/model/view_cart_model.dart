
class CartDataModel{
  List<CartModel>?data;
  String?message;
  bool?status;
  CartDataModel({this.data,this.message,this.status});

  factory CartDataModel.fromJson(Map<String,dynamic> json){
    List<CartModel> mData=[];
    for(Map<String,dynamic> eachData in json['data']){
      mData.add(CartModel.fromJson(eachData));
    }
    return CartDataModel(
      message: json['message'],
      status: json['status'],
      data: mData
    );
  }
}

class CartModel{
  int?id;
  String ?image;
  String? name;
  String? price;
  int?product_id;
  int?quantity;
  CartModel({this.id,this.image,this.name,this.price,this.product_id,this.quantity});
  factory CartModel.fromJson(Map<String,dynamic> json){
    return CartModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      product_id: json['product_id'],
      quantity: json['quantity']

    );
  }
}