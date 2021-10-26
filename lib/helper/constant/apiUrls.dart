import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ApiUrls {
  static const String apiKey = "aFGeUddlfst3r8zF";
  static const String source = "Mobile";
  static const String Loginaction = "getUserJson";
  static const String getLeaderboardaction = "getLeaderBoardPlayersJSON";
  static const String getStatisticaction = "getStatisticsJSON";
  static const String getMatchRequestaction = "requestForAMatchJSON";
  static const String singleSingupaction = "insertSIPLUserJSON";
  static const String profileEditaction = "updateSIPLUserJSON";
  static const String passaction = "updateSIPLUserPassJSON";
  static const String matchaction = "getMatchRequestsJSON";
  static const String cancelMatchaction = "CancelMatchJSON";
  static const String AcceptedMatchaction = "acceptDeclineMatchJSON";
  static const String pendingMatchaction = "getPendingRequestsJSON";
  static const String completedMatchaction = "getCompletedRequestsJSON";
  static const String getPlayersaction = "getPlayersJSON";

  static String baseUrl(String endPoint) => "http://www.sipconline"
      ".com/uat/sipl/api/$endPoint";
  static String login1 = baseUrl("login");

  static String login(String email, String pass) =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$Loginaction&emailid=$email&keycol=$pass");

  static String forgotPassword(String email, String pass) =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$passaction&email=$email&password=$pass");

  static String matchRequest(String id) =>
      baseUrl("?auth=${apiKey}source=$source&action=$matchaction&userid=$id");

  static String cancelMatch(String id) =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$cancelMatchaction&matchid=$id&type=Cancelled");
  //
  // http
  //
  //     : //www.sipconline.com/uat/sipl/api/?auth=aFGeUddlfst3r8zF&source=Mobile&action=acceptDeclineMatchJSON&matchid=918&status=Accepted

  static String matchAccept(String id) =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$AcceptedMatchaction&matchid=$id&status=Accepted");

  static String pendingMatchRequest(String id) =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$pendingMatchaction&userid=$id");

  static String completedMatchRequest(String id) =>
      baseUrl("?auth=${apiKey}source=$source&action=$completedMatchaction"
          "&userid=$id&limit=5");

  // http://www.sipconline.com/uat/sipl/api/?auth=aFGeUddlfst3r8zF&source=Mobile&action=getPlayersJSON&userid=4&email=k.varadharajan@gmail.com&playerfilter=&namefilter

  static String getPlayers(String id, String email) =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$getPlayersaction&userid=$id"
              "&&email=$email&playerfilter=&namefilter");

  static String getPlayersWithSearch(String id, String email, String keyword,
      String filter) =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$getPlayersaction&userid=$id"
              "&&email=$email&playerfilter=$filter&namefilter=$keyword");

  static String getLeaderBoard(String category, String userId) =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$getLeaderboardaction&userid"
              "=$userId"
              "&playerlevel"
              "=$category");

  static String getStatistic() =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$getStatisticaction&table=ALL");

  // http://www.sipconline.com/uat/sipl/api/?auth=aFGeUddlfst3r8zF&source=Mobile&action=requestForAMatchJSON&requester=4&opponent=521

  static String getMatchRequest(String userId, String oppoentId) =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$getMatchRequestaction&requester"
              "=$userId&opponent=$oppoentId");

  static String register(String userData, String images) =>
      baseUrl(
          "?auth=${apiKey}source=$source&action=$singleSingupaction&user=$userData"
              "&credits=50&referid=0&images=$images");

  static String editProfile(String userData, String images) =>
      baseUrl(
          "?source=$source&action=$profileEditaction&user=$userData&images=$images&auth=${apiKey}");
}

class AppAuth {
  AppAuth._();

  static String get appTraceReceiverEmail => "jatin.verma73@gmail.com";

  static String get appMailerEmail => "";

  static String get appMailerPassword => "asdzxc";

  static String get getCompanuCode => "";

  static String get getAuthToken =>
      "JOSMOBILE abcxyzsdfsdrwewer53345345sdwerwer234234";
}

class AppInfo {
  static const String companyName = "psyCourse";
  static const String companyAddress = "Delhi";
  static const String appName = "UpsEducation";
  static const String appVersion = "1.0.0";
  static const String appVersionDisplay = "20210529";
  static const String allRightReserved = "Delhi";

  static const String _ANDROID = "ANDROID";
  static const String _IOS = "IOS";

  static String getPlatform() =>
      defaultTargetPlatform == TargetPlatform.android ? _ANDROID : _IOS;
}
