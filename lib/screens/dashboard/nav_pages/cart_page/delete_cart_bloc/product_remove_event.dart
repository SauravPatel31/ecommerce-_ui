abstract class ProductRemoveEvent{}

class ProductRemoveE extends ProductRemoveEvent{
  int cart_Id;
  ProductRemoveE({required this.cart_Id});
}