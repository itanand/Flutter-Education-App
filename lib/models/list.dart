// ignore: camel_case_types
class list {
  final String name;
  final String count;
  final String imageUrl;

  list({this.imageUrl, this.name, this.count});
}

List<list> categoryData = [
  new list(
    imageUrl:"assets/images/tops.png",
    name: "TOPS",
    count: "6"
  ),
  new list(
    imageUrl:   "assets/images/bottoms.png",
    name: "BOTTOMS",
    count: "6"
  ),
  new list(
    imageUrl:   "assets/images/dress.png",
    name: "DRESSES",
    count: "6"
  ),
  new list(
    imageUrl:   "assets/images/coat.png",
    name: "COATS",
    count: "6"
  ),
  new list(
    imageUrl:   "assets/images/suits.png",
    name: "SUITS",
    count: "6"
  ),

];