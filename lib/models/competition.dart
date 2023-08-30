class Competition {
  String? date;
  num? pointX;
  Team? teamA;
  Team? teamB;
  num? pointA;
  num? pointB;
  String? status;

  Competition(
      {this.date,
      this.pointX,
      this.teamA,
      this.teamB,
      this.pointA,
      this.pointB,
      this.status});

  Competition.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    pointX = json['pointX'];
    teamA = json['teamA'] != null ? Team.fromJson(json['teamA']) : null;
    teamB = json['teamB'] != null ? Team.fromJson(json['teamB']) : null;
    pointA = json['pointA'];
    pointB = json['pointB'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['pointX'] = pointX;
    if (teamA != null) {
      data['teamA'] = teamA!.toJson();
    }
    if (teamB != null) {
      data['teamB'] = teamB!.toJson();
    }
    data['pointA'] = pointA;
    data['pointB'] = pointB;
    data['status'] = status;
    return data;
  }
}

class Team {
  String? abr;
  String? image;
  String? name;

  Team({this.abr, this.image, this.name});

  Team.fromJson(Map<String, dynamic> json) {
    abr = json['abr'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['abr'] = abr;
    data['image'] = image;
    data['name'] = name;
    return data;
  }
}
