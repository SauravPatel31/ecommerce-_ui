class ProductModel{
  List<ProductDataModel>? data;
  String? message;
  bool? status;
  ProductModel({this.data,this.message,this.status});

  factory ProductModel.fromJson(Map<String,dynamic> json){
    List<ProductDataModel> mProducts=[];
    for(Map<String,dynamic> eachProducts in json['data']){
      mProducts.add(ProductDataModel.fromJson(eachProducts));
    }
    return ProductModel(
      message: json['message'],
      status: json['status'],
      data: mProducts,
    );
  }
}

class ProductDataModel{
  String? category_id;
  String? created_at;
  String? id;
  String? image;
  String? name;
  String? price;
  String? status;
  String? updated_at;

  ProductDataModel({this.category_id,this.created_at,this.id,this.image,this.name,this.price,this.status,this.updated_at});

  factory ProductDataModel.fromJson(Map<String,dynamic> json){
    return ProductDataModel(
      category_id: json['category_id'],
      created_at: json['created_at'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      price: json['price'],
      status: json['status'],
      updated_at: json['updated_at'],
    );
  }
}

