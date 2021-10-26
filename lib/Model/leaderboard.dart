class LeadrboardModel {
  String? userid;
  String? fullname;
  String? playerlevel;
  String? playerimage;
  String? credits;
  String? initialCredits;
  String? earnedCredits;
  String? emailid;
  String? keycol;
  String? isActive; // may be get in int
  String? creditsreqd;
  String? notifyto;
  String? rating;
  String? ranking;
  String? ratio;
  String? percentage;
  String? consentedon;
  String? consentedon2;
  String? consentedon3;
  String? location;
  String? description;
  String? category;
  String? equipment;
  String? tshirt;
  String? shirtRedeemed;
  String? preflocation;
  String? preftime;
  String? partner;
  String? played;
  int? wins;
  int? schedules;
  String? pending;
  int? requests;
  String? goldwins;
  String? silverwins;
  String? bronzewins;
  String? teamid;
  String? age;
  String? postalcode;
  String? isAdmin;
  String? membertype;
  String? hrsavailable;
  String? mexpirydate;
  String? isPaid;
  int? matches;
  String mobile = "";
  String cPass = "";

  LeadrboardModel(
      {this.userid,
        this.fullname,
        this.playerlevel,
        this.playerimage = "",
        this.credits,
        this.mobile="",
        this.cPass="",
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
        this.matches});

  LeadrboardModel.fromJson(Map<String, dynamic> json) {
    playerlevel = json['playerlevel'] == null ? "" :json['playerlevel'];
    playerimage = json['playerimage'] == null ? "" :json['playerimage'];
    // playerimage = json['playerimage'].cast<String>();
    fullname = json['fullname'] == null ? "" :json['fullname'];
    userid = json['userid'] == null ? "" :json['userid'];
    credits = json['credits'] == null ? "" :json['credits'];
    initialCredits = json['initialCredits'] == null ? "" :json['initialCredits'];
    earnedCredits = json['earnedCredits'] == null ? "" :json['earnedCredits'];
    emailid = json['emailid'] == null  ? "" :json['emailid'];
    keycol = json['keycol'] == null  ? "" :json['keycol'];
    isActive = json['isActive'] == null  ? "" :json['isActive'];
    creditsreqd = json['creditsreqd'] == null  ? "" :json['creditsreqd'];
    percentage = json['percentage'] == null  ? "" :json['percentage'];
    ratio = json['ratio'] == null  ? "" :json['ratio'];
    ranking = json['ranking'] == null  ? "" :json['ranking'];
    rating = json['rating']  == null ? "" :json['rating'];
    notifyto = json['notifyto'] == null  ? "" :json['notifyto'];
    postalcode = json['postalcode'] == null  ? "" :json['postalcode'];
    age = json['age'] == null ? "": json['age'];
    teamid = json['teamid'] == null  ? "" :json['teamid'];
    bronzewins = json['bronzewins'] == null  ? "" :json['bronzewins'];
    silverwins = json['silverwins'] == null  ? "" :json['silverwins'];
    goldwins = json['goldwins'] == null  ? "" :json['goldwins'];
    requests = json['requests'] == null  ? "" :json['requests'];
    pending = json['pending'] == null  ? "" :json['pending'];
    schedules = json['schedules'] == null  ? "" :json['schedules'];
    wins = json['wins'] == null  ? "" :json['wins'];
    played = json['played'] == null  ? "" :json['played'];
    partner = json['partner'] == null  ? "" :json['partner'];
    preftime = json['preftime'] == null  ? "" :json['preftime'];
    preflocation = json['preflocation'] == null  ? "" :json['preflocation'];
    shirtRedeemed = json['shirtRedeemed'] == null  ? "" :json['shirtRedeemed'];
    tshirt = json['tshirt']  == null ? "" :json['tshirt'];
    equipment = json['equipment'] == null  ? "" :json['equipment'];
    category = json['category'] == null  ? "" :json['category'];
    location = json['location'] == null  ? "" :json['location'];
    consentedon = json['consentedon'] == null  ? "" :json['consentedon'];
    consentedon2 = json['consentedon2'] == null  ? "" :json['consentedon2'];
    consentedon3 = json['consentedon3'] == null  ? "" :json['consentedon3'];
    description = json['description'] == null  ? "" :json['description'];
    matches = json['matches'] == null  ? "" :json['matches'];
    isPaid = json['isPaid'] == null  ? "" :json['isPaid'];
    mexpirydate = json['mexpirydate'] == null  ? "" :json['mexpirydate'];
    hrsavailable = json['hrsavailable'] == null  ? "" : json['hrsavailable'];
    membertype = json['membertype'] == null  ? "" : json['membertype'];
    isAdmin = json['isAdmin'] == null  ? "" : json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['playerlevel'] = this.playerlevel;
    json['playerimage'] = this.playerimage;
    json['fullname'] = this.fullname;
    json['userid'] = this.userid;
    json['credits'] = this.credits;
    json['initialCredits'] = this.initialCredits;
    json['earnedCredits'] = this.earnedCredits;
    json['emailid'] = this.emailid;
    json['keycol'] = this.keycol;
    json['isActive'] = this.isActive;
    json['creditsreqd'] = this.creditsreqd;
    json['percentage'] = this.percentage;
    json['ratio'] = this.ratio;
    json['ranking'] = this.ranking;
    json['rating'] = this.rating;
    json['notifyto'] = this.notifyto;
    json['postalcode'] = this.postalcode;
    json['age'] = this.age;
    json['teamid'] = this.teamid;
    json['bronzewins'] = this.bronzewins;
    json['silverwins'] = this.silverwins;
    json['goldwins'] = this.goldwins;
    json['requests'] = this.requests;
    json['pending'] = this.pending;
    json['schedules'] = this.schedules;
    json['wins'] = this.wins;
    json['played'] = this.played;
    json['partner'] = this.partner;
    json['preftime'] = this.preftime;
    json['preflocation'] = this.preflocation;
    json['shirtRedeemed'] = this.shirtRedeemed;
    json['tshirt'] = this.tshirt;
    json['equipment'] = this.equipment;
    json['category'] = this.category;
    json['location'] = this.location;
    json['consentedon'] = this.consentedon;
    json['consentedon2'] = this.consentedon2;
    json['consentedon3'] = this.consentedon3;
    json['description'] = this.description;
    json['matches'] = this.matches;
    json['isPaid'] = this.isPaid;
    json['mexpirydate'] = this.mexpirydate;
    json['hrsavailable'] = this.hrsavailable;
    json['membertype'] = this.membertype;
    json['isAdmin'] = this.isAdmin;

    return json;
  }
}