
class CoffeMenu{
  String image;
  String name;
  double price;
  bool isBuy=false;

  CoffeMenu(this.image, this.name, this.price);


  @override
  int get hashCode =>Object.hash(runtimeType, image,name,price,isBuy);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoffeMenu &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price))&&
            (identical(other.isBuy, isBuy) || other.isBuy == isBuy);
  }
}