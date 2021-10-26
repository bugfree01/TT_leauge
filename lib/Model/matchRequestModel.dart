class MatchRequestModel {
  late String status;
  late String message;
  List<Requests>? requests = [];

  MatchRequestModel({this.status ="", this.message="", this.requests});

  MatchRequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['requests'] != null) {
      requests!.clear();
      json['requests'].forEach((v) {
        requests!.add(new Requests.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['message'] = this.message;
  //   if (this.requests != null) {
  //     data['requests'] = this.requests.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
class Requests {
  String? requestid;
  Requester? requester;
  Requester? opponent;
  String ?  requestedon;
  String ?  acceptedon;
  String ?  remindedon;
  String ?  status;
  String ?  winner;
  Tournament? tournament;
  String ?  scheduledat;
  String ?  venue;
  String ?  table;
  String ?  round;
  String ?  group;
  String ?  division;
  String ?  points;

  Requests(
      {this.requestid,
        this.requester,
        this.opponent,
        this.requestedon,
        this.acceptedon,
        this.remindedon,
        this.status,
        this.winner,
        this.tournament,
        this.scheduledat,
        this.venue,
        this.table,
        this.round,
        this.group,
        this.division,
        this.points});

  Requests.fromJson(Map<String, dynamic> json) {
    requestid = json['requestid'];
    requester = json['requester'] != null
        ? new Requester.fromJson(json['requester'])
        : null;
    opponent = json['opponent'] != null
        ? new Requester.fromJson(json['opponent'])
        : null;
    requestedon = json['requestedon'];
    acceptedon = json['acceptedon'];
    remindedon = json['remindedon'];
    status = json['status'];
    winner = json['winner'];
    tournament = json['tournament'] != null
        ? new Tournament.fromJson(json['tournament'])
        : null;
    scheduledat = json['scheduledat'];
    venue = json['venue'];
    table = json['table'];
    round = json['round'];
    group = json['group'];
    division = json['division'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestid'] = this.requestid;
    if (this.requester != null) {
      data['requester'] = this.requester!.toJson();
    }
    if (this.opponent != null) {
      data['opponent'] = this.opponent!.toJson();
    }
    data['requestedon'] = this.requestedon;
    data['acceptedon'] = this.acceptedon;
    data['remindedon'] = this.remindedon;
    data['status'] = this.status;
    data['winner'] = this.winner;
    if (this.tournament != null) {
      data['tournament'] = this.tournament!.toJson();
    }
    data['scheduledat'] = this.scheduledat;
    data['venue'] = this.venue;
    data['table'] = this.table;
    data['round'] = this.round;
    data['group'] = this.group;
    data['division'] = this.division;
    data['points'] = this.points;
    return data;
  }
}

class Requester {
  String ?  userid;
  String ?  fullname;
  String ?  playerlevel;
  String ?  playerimage;
  String ?  playerimage2;
  String ?  credits;
  String ?  initialCredits;
  String ?  earnedCredits;
  String ?  emailid;
  String ?  keycol;
  String ?  isActive;
  String ?  creditsreqd;
  String ?  notifyto;
  String ?  rating;
  String ?  ranking;
  String ?  ratio;
  String ?  percentage;
  String ?  consentedon;
  String ?  consentedon2;
  String ?  consentedon3;
  String ?  location;
  String ?  description;
  String ?  category;
  String ?  equipment;
  String ?  tshirt;
  String ?  shirtRedeemed;
  String ?  preflocation;
  String ?  preftime;
  String ?  partner;
  String ?  played;
  int? wins;
  int? schedules;
  String ?  pending;
  int? requests;
  String ?  goldwins;
  String ?  silverwins;
  String ?  bronzewins;
  String ?  teamid;
  String ?  age;
  String ?  postalcode;
  String ?  isAdmin;
  String ?  membertype;
  String ?  hrsavailable;
  String ?  mexpirydate;
  String ?  isPaid;
  List<String>? playerimages;
  int? matches;

  Requester(
      {this.userid,
        this.fullname,
        this.playerlevel,
        this.playerimage,
        this.playerimage2,
        this.credits,
        this.initialCredits,
        this.earnedCredits,
        this.emailid,
        this.keycol,
        this.isActive,
        this.creditsreqd,
        this.notifyto,
        this.rating,
        this.ranking,
        this.ratio,
        this.percentage,
        this.consentedon,
        this.consentedon2,
        this.consentedon3,
        this.location,
        this.description,
        this.category,
        this.equipment,
        this.tshirt,
        this.shirtRedeemed,
        this.preflocation,
        this.preftime,
        this.partner,
        this.played,
        this.wins,
        this.schedules,
        this.pending,
        this.requests,
        this.goldwins,
        this.silverwins,
        this.bronzewins,
        this.teamid,
        this.age,
        this.postalcode,
        this.isAdmin,
        this.membertype,
        this.hrsavailable,
        this.mexpirydate,
        this.isPaid,
        this.playerimages,
        this.matches});

  Requester.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    fullname = json['fullname'];
    playerlevel = json['playerlevel'];
    playerimage = json['playerimage'];
    playerimage2 = json['playerimage2'];
    credits = json['credits'];
    initialCredits = json['initialCredits'];
    earnedCredits = json['earnedCredits'];
    emailid = json['emailid'];
    keycol = json['keycol'];
    isActive = json['isActive'];
    creditsreqd = json['creditsreqd'];
    notifyto = json['notifyto'];
    rating = json['rating'];
    ranking = json['ranking'];
    ratio = json['ratio'];
    percentage = json['percentage'];
    consentedon = json['consentedon'];
    consentedon2 = json['consentedon2'];
    consentedon3 = json['consentedon3'];
    location = json['location'];
    description = json['description'];
    category = json['category'];
    equipment = json['equipment'];
    tshirt = json['tshirt'];
    shirtRedeemed = json['shirtRedeemed'];
    preflocation = json['preflocation'];
    preftime = json['preftime'];
    partner = json['partner'];
    played = json['played'];
    wins = json['wins'];
    schedules = json['schedules'];
    pending = json['pending'];
    requests = json['requests'];
    goldwins = json['goldwins'];
    silverwins = json['silverwins'];
    bronzewins = json['bronzewins'];
    teamid = json['teamid'];
    age = json['age'];
    postalcode = json['postalcode'];
    isAdmin = json['isAdmin'];
    membertype = json['membertype'];
    hrsavailable = json['hrsavailable'];
    mexpirydate = json['mexpirydate'];
    isPaid = json['isPaid'];
    playerimages = json['playerimages'].cast<String>();
    matches = json['matches'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['fullname'] = this.fullname;
    data['playerlevel'] = this.playerlevel;
    data['playerimage'] = this.playerimage;
    data['playerimage2'] = this.playerimage2;
    data['credits'] = this.credits;
    data['initialCredits'] = this.initialCredits;
    data['earnedCredits'] = this.earnedCredits;
    data['emailid'] = this.emailid;
    data['keycol'] = this.keycol;
    data['isActive'] = this.isActive;
    data['creditsreqd'] = this.creditsreqd;
    data['notifyto'] = this.notifyto;
    data['rating'] = this.rating;
    data['ranking'] = this.ranking;
    data['ratio'] = this.ratio;
    data['percentage'] = this.percentage;
    data['consentedon'] = this.consentedon;
    data['consentedon2'] = this.consentedon2;
    data['consentedon3'] = this.consentedon3;
    data['location'] = this.location;
    data['description'] = this.description;
    data['category'] = this.category;
    data['equipment'] = this.equipment;
    data['tshirt'] = this.tshirt;
    data['shirtRedeemed'] = this.shirtRedeemed;
    data['preflocation'] = this.preflocation;
    data['preftime'] = this.preftime;
    data['partner'] = this.partner;
    data['played'] = this.played;
    data['wins'] = this.wins;
    data['schedules'] = this.schedules;
    data['pending'] = this.pending;
    data['requests'] = this.requests;
    data['goldwins'] = this.goldwins;
    data['silverwins'] = this.silverwins;
    data['bronzewins'] = this.bronzewins;
    data['teamid'] = this.teamid;
    data['age'] = this.age;
    data['postalcode'] = this.postalcode;
    data['isAdmin'] = this.isAdmin;
    data['membertype'] = this.membertype;
    data['hrsavailable'] = this.hrsavailable;
    data['mexpirydate'] = this.mexpirydate;
    data['isPaid'] = this.isPaid;
    data['playerimages'] = this.playerimages;
    data['matches'] = this.matches;
    return data;
  }
}

class Tournament {
  String ?  tid;
  String ?  name;
  String ?  description;
  String ?  venue;
  String ?  startdate;
  String ?  enddate;
  String ?  maxplayers;
  String ?  country;
  String ?  status;
  String ?  entryfee;
  Requester? winner;
  String ?  poster;
  String ?  masterevent;
  int? currregistrations;
  String ?  prizes;
  String ?  rules;
  String ?  safety;
  String ?  banner;
  String ?  registrationstart;
  String ?  registrationend;
  String ?  maxage;
  String ?  minage;
  String ?  checkbox1;
  String ?  checkbox2;
  String ?  checkbox3;
  String ?  units;
  String ?  matchduration;
  String ?  bestof;
  String ?  maxpoints;
  String ?  windiff;
  String ?  nooftables;
  String ?  type;
  String ?  action;
  String ?  unit;

  Tournament(
      {this.tid,
        this.name,
        this.description,
        this.venue,
        this.startdate,
        this.enddate,
        this.maxplayers,
        this.country,
        this.status,
        this.entryfee,
        this.winner,
        this.poster,
        this.masterevent,
        this.currregistrations,
        this.prizes,
        this.rules,
        this.safety,
        this.banner,
        this.registrationstart,
        this.registrationend,
        this.maxage,
        this.minage,
        this.checkbox1,
        this.checkbox2,
        this.checkbox3,
        this.units,
        this.matchduration,
        this.bestof,
        this.maxpoints,
        this.windiff,
        this.nooftables,
        this.type,
        this.action,
        this.unit});

  Tournament.fromJson(Map<String ? , dynamic> json) {
    tid = json['tid'];
    name = json['name'];
    description = json['description'];
    venue = json['venue'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    maxplayers = json['maxplayers'];
    country = json['country'];
    status = json['status'];
    entryfee = json['entryfee'];
    winner =
    json['winner'] != null ? new Requester.fromJson(json['winner']) : null;
    poster = json['poster'];
    masterevent = json['masterevent'];
    currregistrations = json['currregistrations'];
    prizes = json['prizes'];
    rules = json['rules'];
    safety = json['safety'];
    banner = json['banner'];
    registrationstart = json['registrationstart'];
    registrationend = json['registrationend'];
    maxage = json['maxage'];
    minage = json['minage'];
    checkbox1 = json['checkbox1'];
    checkbox2 = json['checkbox2'];
    checkbox3 = json['checkbox3'];
    units = json['units'];
    matchduration = json['matchduration'];
    bestof = json['bestof'];
    maxpoints = json['maxpoints'];
    windiff = json['windiff'];
    nooftables = json['nooftables'];
    type = json['type'];
    action = json['action'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tid'] = this.tid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['venue'] = this.venue;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['maxplayers'] = this.maxplayers;
    data['country'] = this.country;
    data['status'] = this.status;
    data['entryfee'] = this.entryfee;
    if (this.winner != null) {
      data['winner'] = this.winner!.toJson();
    }
    data['poster'] = this.poster;
    data['masterevent'] = this.masterevent;
    data['currregistrations'] = this.currregistrations;
    data['prizes'] = this.prizes;
    data['rules'] = this.rules;
    data['safety'] = this.safety;
    data['banner'] = this.banner;
    data['registrationstart'] = this.registrationstart;
    data['registrationend'] = this.registrationend;
    data['maxage'] = this.maxage;
    data['minage'] = this.minage;
    data['checkbox1'] = this.checkbox1;
    data['checkbox2'] = this.checkbox2;
    data['checkbox3'] = this.checkbox3;
    data['units'] = this.units;
    data['matchduration'] = this.matchduration;
    data['bestof'] = this.bestof;
    data['maxpoints'] = this.maxpoints;
    data['windiff'] = this.windiff;
    data['nooftables'] = this.nooftables;
    data['type'] = this.type;
    data['action'] = this.action;
    data['unit'] = this.unit;
    return data;
  }
}