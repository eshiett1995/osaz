
import 'Need.dart';

class OrphanageHome {

  OrphanageHome();

  String id;

  String name;

  var coordinate = [];

  List<Need> needs = [];

  String details;

  String address;

  factory OrphanageHome.fromJson(Map<String, dynamic> parsedJson) {
    OrphanageHome orphanageHome = new OrphanageHome();

    orphanageHome.id = parsedJson['_id'];

    orphanageHome.name = parsedJson['name'];

    //orphanageHome.coordinate = User.fromJson(parsedJson['sender']);

    //orphanageHome.needs = User.fromJson(parsedJson['receiver']);

    orphanageHome.details = parsedJson['details'];

    orphanageHome.address = parsedJson['address'];

    return orphanageHome;
  }


  Map<String, dynamic> toJson() => {

    '"_id"': '"$id"',

    //'"dateCreated"': dateCreated,

    '"name"': '"$name"',

    '"coordinate"': '"$coordinate"',

    //'"needs"': needs.isEmpty? null : needs.toJson(),

    '"details"': '"$details"',

    '"address"': '$address',
  };
}
