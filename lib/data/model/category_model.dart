class CategoryModel{
  List<CategoryDataModel>?data;
  String? message;
  bool?status;
  CategoryModel({this.data,this.message,this.status});

  factory CategoryModel.fromJson(Map<String,dynamic> json){
    List<CategoryDataModel> mData =[];
    for(Map<String,dynamic>eachCat in json['data']){
      mData.add(CategoryDataModel.fromJson(eachCat));
    }
    return CategoryModel(
      data: mData,
      message: json['message'],
      status: json['status']
    );
  }
}


class CategoryDataModel{
  String? created_at;
  String? id;
  String? name;
  String?status;
  String?updated_at;

  CategoryDataModel({this.created_at,this.id,this.name,this.status,this.updated_at});

  factory CategoryDataModel.fromJson(Map<String,dynamic> json){
    return CategoryDataModel(
      created_at: json['created_at'],
      id: json['id'],
      name: json['name'],
      status: json['status'],
      updated_at: json['updated_at']
    );
  }
}