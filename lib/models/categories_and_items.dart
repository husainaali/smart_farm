class CategoriesList {
  int? catID;
  String? catName;
  String? imagePath;
  List<ItemsList> itemsList;

  CategoriesList(this.catID, this.catName, this.imagePath, this.itemsList);
}

class ItemsList {
  int? itemID;
  String? itemName;
  String? itemDiscreption;
  String? imagePath;
  double? price;
  int itemQty;

  ItemsList(this.itemID, this.itemName, this.itemDiscreption, this.imagePath,
      this.price, this.itemQty);
}
