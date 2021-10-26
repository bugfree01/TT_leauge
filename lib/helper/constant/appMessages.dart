abstract class AppMessages {
  static String get server500 => "Server having issue, try again";

  static String get server400 => 'Please check your credentials';

  static String get server300 => 'Server having issue, try again';

  static String get wrongCredentials => "Wrong credentials";

  static String get userName => "UserName not match";

  static String get validEmaiId => "UserName must not be empty!";

  static String get validPassword => "password must not be empty!";

  static String get wrongNumber => "Please enter your registered Mobile Number";

  static String get forgotPassword => "Password not match. ";

  static String get getNoInternetMsg => "Internet not available.";

  static String get getTechnicalErrorMsg => "Technical Error";

  static String get failedToUploadMsg => "Failed to upload document";

  static String get notPermittedMsg =>
      "You can't login using these credentials";

  static String get successMsg => "Success";

  static String get somethingWentWrongMsg => "Something Went Wrong";

  static String get invalidCredentialsMsg => "Invalid Credentials";

  static String get unAssociatedEmailMsg =>
      "Given Email-id Is not registered with Finance Optima";

  static String get technicalErrorMsg => "TECHNICAL ERROR";

//  ======================== REPLACEMENTS =======================

  static String get replaceString1 => '<?xml version="1.0" encoding="utf-8"?>';

  static String get replaceString2 => '<string xmlns="http://tempuri.org/">';

  static String get replaceString3 => '</string>';




  //url-not valid --------------------------------------------------------------
  static String get urlNotValid => "URL not valid";

  //-user pin wrong ------------------------------------------------------------
  static String get wrongPin => "Wrong pin";
  static String get jsonParsingError => "JSON PARSING ERROR";
//initial state message
  static String get initialStateMSG => "Loading...";


  static String get replaceString4 => 'amp;';

  ////////////accountPAge////////////////
static String get accountMsg => "From your account dashboard, you can easily check & view your recent courses and edit your password and account details.";
}
