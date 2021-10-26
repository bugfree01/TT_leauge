

import 'package:tt_league/helper/localStorage/prefKeys.dart';

import 'AppPrefrences.dart';

class PreferenceHandler {
  PreferenceHandler._();

  static Future<void> setLoginToken(String companyCode) async {
   await AppPrefrence.setString(PrefKeys.token, companyCode);
  }

  static Future<String?> getLoginToken() async {
    return await AppPrefrence.getString(PrefKeys.token);
  }
  //============================================//

  static Future<void> setUserId(String userId) async {
   await AppPrefrence.setString(PrefKeys.userId, userId);
  }

  static Future<String?> getUserId() async {
    return AppPrefrence.getString(PrefKeys.userId);
  }
  //============================================//

  static Future<void> setGender(String userId) async {
   await AppPrefrence.setString(PrefKeys.gender, userId);
  }

  static Future<String?> getGender() async {
    return AppPrefrence.getString(PrefKeys.gender);
  }
 //============================================//

  static Future<void> setName(String userId) async {
   await AppPrefrence.setString(PrefKeys.userName, userId);
  }

  static Future<String?> getName() async {
    return AppPrefrence.getString(PrefKeys.userName);
  }
//============================================//

  static Future<void> setPalyerLevel(String userId) async {
   await AppPrefrence.setString(PrefKeys.playerLevel, userId);
  }

  static Future<String?> getPalyerLevel() async {
    return AppPrefrence.getString(PrefKeys.playerLevel);
  }
//============================================//

  static Future<void> setShirtRedeem(String userId) async {
   await AppPrefrence.setString(PrefKeys.shirtReddem, userId);
  }

  static Future<String?> getShirtRedeem() async {
    return AppPrefrence.getString(PrefKeys.shirtReddem);
  }
//============================================//
  static Future<void> setPalyerImage(String userId) async {
   await AppPrefrence.setString(PrefKeys.playerImage, userId);
  }

  static Future<String?> getPalyerImage() async {
    return AppPrefrence.getString(PrefKeys.playerImage);
  }//============================================//
  static Future<void> setPalyerImage1(String userId) async {
   await AppPrefrence.setString(PrefKeys.playerImage1, userId);
  }

  static Future<String?> getPalyerImage1() async {
    return AppPrefrence.getString(PrefKeys.playerImage1);
  }//============================================//
  static Future<void> setPalyerImage2(String userId) async {
   await AppPrefrence.setString(PrefKeys.playerImage2, userId);
  }

  static Future<String?> getPalyerImage2() async {
    return AppPrefrence.getString(PrefKeys.playerImage2);
  }//============================================//
  static Future<void> setPalyerImage3(String userId) async {
   await AppPrefrence.setString(PrefKeys.playerImage3, userId);
  }

  static Future<String?> getPalyerImage3() async {
    return AppPrefrence.getString(PrefKeys.playerImage3);
  }//============================================//
  static Future<void> setPalyerImage4(String userId) async {
   await AppPrefrence.setString(PrefKeys.playerImage4, userId);
  }

  static Future<String?> getPalyerImage4() async {
    return AppPrefrence.getString(PrefKeys.playerImage4);
  }//============================================//
  static Future<void> setPalyerImage5(String userId) async {
   await AppPrefrence.setString(PrefKeys.playerImage5, userId);
  }

  static Future<String?> getPalyerImage5() async {
    return AppPrefrence.getString(PrefKeys.playerImage5);
  }

  //============================================//
  static Future<void> setPassword(String userId) async {
   await AppPrefrence.setString(PrefKeys.userPassword, userId);
  }

  static Future<String?> getPassword() async {
    return AppPrefrence.getString(PrefKeys.userPassword);
  }
  //============================================//
  static Future<void> setEmail(String userId) async {
   await AppPrefrence.setString(PrefKeys.userEmail, userId);
  }

  static Future<String?> getEmail() async {
    return AppPrefrence.getString(PrefKeys.userEmail);
  } //============================================//
  static Future<void> setMobile(String userId) async {
   await AppPrefrence.setString(PrefKeys.userMobile, userId);
  }

  static Future<String?> getMobile() async {
    return AppPrefrence.getString(PrefKeys.userMobile);
  }

//============================================//

  static Future<void> setWins(String userId) async {
   await AppPrefrence.setString(PrefKeys.wins, userId);
  }

  static Future<String?> getWins() async {
    return AppPrefrence.getString(PrefKeys.wins);
  }
  //============================================//

  static Future<void> setMatches(String userId) async {
   await AppPrefrence.setString(PrefKeys.matches, userId);
  }

  static Future<String?> getMatches() async {
    return AppPrefrence.getString(PrefKeys.matches);
  }

 //============================================//

  static Future<void> setWinPercentage(String userId) async {
   await AppPrefrence.setString(PrefKeys.winsPercentage, userId);
  }

  static Future<String?> getWinPercentage() async {
    return AppPrefrence.getString(PrefKeys.winsPercentage);
  }
//============================================//

  static Future<void> setEarnedCredit(String userId) async {
   await AppPrefrence.setString(PrefKeys.eCredit, userId);
  }

  static Future<String?> getEarnedCredit() async {
    return AppPrefrence.getString(PrefKeys.eCredit);
  }
//============================================//
// ============================================//

  static Future<void> setCredit(String userId) async {
   await AppPrefrence.setString(PrefKeys.credit, userId);
  }

  static Future<String?> getCredit() async {
    return AppPrefrence.getString(PrefKeys.credit);
  }
//============================================//
//============================================//

  static Future<void> setPreffTime(String userId) async {
   await AppPrefrence.setString(PrefKeys.Time, userId);
  }

  static Future<String?> getPreffTime() async {
    return AppPrefrence.getString(PrefKeys.Time);
  }
// ============================================//

  static Future<void> setPrefLocation(String userId) async {
   await AppPrefrence.setString(PrefKeys.pLocate, userId);
  }

  static Future<String?> getPrefLocation() async {
    return AppPrefrence.getString(PrefKeys.pLocate);
  }
// ============================================//

  static Future<void> setLocation(String userId) async {
   await AppPrefrence.setString(PrefKeys.location, userId);
  }

  static Future<String?> getLocation() async {
    return AppPrefrence.getString(PrefKeys.location);
  }
  //============================================//

  static Future<void> setAboutMe(String userId) async {
   await AppPrefrence.setString(PrefKeys.aboutME, userId);
  }

  static Future<String?> getAboutMe() async {
    return AppPrefrence.getString(PrefKeys.aboutME);
  }
 //============================================//

  static Future<void> setAge(String userId) async {
   await AppPrefrence.setString(PrefKeys.age, userId);
  }

  static Future<String?> getAge() async {
    return AppPrefrence.getString(PrefKeys.age);
  }
  //============================================//

  static Future<void> setGoldWins(String userId) async {
   await AppPrefrence.setString(PrefKeys.gwin, userId);
  }

  static Future<String?> getGoldWins() async {
    return AppPrefrence.getString(PrefKeys.gwin);
  }

//=====================================================
  //============================================//

  static Future<void> setSilverWins(String userId) async {
   await AppPrefrence.setString(PrefKeys.swin, userId);
  }

  static Future<String?> getSilverWins() async {
    return AppPrefrence.getString(PrefKeys.swin);
  }

//=====================================================
  //============================================//

  static Future<void> setBronzeWins(String userId) async {
   await AppPrefrence.setString(PrefKeys.bwin, userId);
  }

  static Future<String?> getBronzeWins() async {
    return AppPrefrence.getString(PrefKeys.bwin);
  }

//=====================================================

  static Future<void> setShirt(String userId) async {
   await AppPrefrence.setString(PrefKeys.shirt, userId);
  }

  static Future<String?> getShirt() async {
    return AppPrefrence.getString(PrefKeys.shirt);
  }

//=====================================================

  static Future<void> setLogIn(bool isDownloaded) async {
    await AppPrefrence.setBoolean(PrefKeys.isDownloaded, isDownloaded);
  }

  static Future<bool> isLogIn() async {
    return AppPrefrence.getBoolean(PrefKeys.isDownloaded);
  }

//=====================================================
  static Future<void> setTesting(bool isDownloaded) async {
    await AppPrefrence.setBoolean(PrefKeys.testing, isDownloaded);
  }

  static Future<bool> getTesting() async {
    return AppPrefrence.getBoolean(PrefKeys.testing);
  }

  //=====================================================
  static void clearPref() {
    AppPrefrence.clearPrefrence();
  }


}

