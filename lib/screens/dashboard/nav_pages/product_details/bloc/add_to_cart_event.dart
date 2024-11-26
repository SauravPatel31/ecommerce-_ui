abstract class AddToCartEvent{}

class ProductAddToCartEvent extends AddToCartEvent{
  int productId;
  int quantity;
  ProductAddToCartEvent({required this.productId,required this.quantity});
}