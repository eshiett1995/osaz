
class Need {

  Need();

  String id;
  String detail;
  int quantityNeeded;
  int quantityDelivered;

  factory Need.fromJson(Map<String, dynamic> parsedJson) {
    Need need = new Need();
    need.id = parsedJson['_id'];
    need.quantityNeeded = parsedJson['quantityNeeded'];
    need.quantityDelivered = parsedJson['quantityDelivered'];
    return need;
  }

    Map<String, dynamic> toJson() => {
    '"_id"': '"$id"',
    //'"dateCreated"': dateCreated,
    '"detail"': '"$detail"',
    '"quantityNeeded"': '"$quantityNeeded"',
    '"quantityDelivered"': '"$quantityDelivered"',
    };
}
