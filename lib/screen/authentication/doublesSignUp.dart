import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tt_league/helper/app_utilities/app_theme.dart';
import 'package:tt_league/screen/customWidget/dxWidget/dx_text.dart';

import '../../helper/app_utilities/appImages.dart';

class DoublesSignUp extends StatefulWidget {
  static const routeName = '/doubles-sign-up';
  const DoublesSignUp({Key? key}) : super(key: key);

  @override
  _DoublesSignUpState createState() => _DoublesSignUpState();
}

class _DoublesSignUpState extends State<DoublesSignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? selectedPlayerLevel = 'Basic';
  List<String> playerLevelDropdown = ['Basic', 'Intermediate', 'Advanced'];

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: materialPrimaryColor,
        appBar: AppBar(toolbarHeight: 0.0, backgroundColor: Colors.transparent),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 40, 48, 20),
                child: Image.asset(AppImages.logo),
              ),
              Container(
                // color: Colors.blue,
                padding: const EdgeInsets.fromLTRB(48, 0, 48, 30),
                child: FittedBox(
                  child: DxTextYellow(
                    'Open Doubles Sign up',
                    textAlign: TextAlign.center,
                    mSize: 18,mBold: true,
                  ),
                ),
              ),
              Text(
                'Player 1',
                style: TextStyle(
                    fontFamily: 'Montserrat-SemiBold',
                    fontSize: 16.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "First Name",
                hintText: 'Your First Name',
                controller: usernameController,
                obscureText: false,
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "Last Name",
                hintText: 'Your Last Name',
                controller: usernameController,
                obscureText: false,
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "Email Address",
                hintText: 'Your Email Address',
                controller: usernameController,
                obscureText: false,
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "Mobile Number (for notifications)",
                hintText: 'Mobile- 8 digits only',
                controller: usernameController,
                obscureText: false,
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "Age (As on 31st Dec this year)",
                hintText: '* * * * * * * * * *',
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 20),
              Text(
                'Player 2',
                style: TextStyle(
                    fontFamily: 'Montserrat-SemiBold',
                    fontSize: 16.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "First Name",
                hintText: 'Your First Name',
                controller: usernameController,
                obscureText: false,
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "Last Name",
                hintText: 'Your Last Name',
                controller: usernameController,
                obscureText: false,
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "Email Address",
                hintText: 'Your Email Address',
                controller: usernameController,
                obscureText: false,
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "Mobile Number (for notifications)",
                hintText: 'Mobile- 8 digits only',
                controller: usernameController,
                obscureText: false,
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "Age (As on 31st Dec this year)",
                hintText: '* * * * * * * * * *',
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "Password",
                hintText: '* * * * * * * * * *',
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 20),
              buildTextField(
                heading: "Repeat Password",
                hintText: '* * * * * * * * * *',
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 40),
              buildSubmitButton(context),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 40, 60, 20),
                child: DxTextWhite(
                  'By clicking start, you agree to our Terms and Conditions ',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }

  Padding buildTextField({
    bool obscureText = false,
    String? heading,
    String? hintText,
    String? Function(String?)? validator,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading!,
            style: TextStyle(
                fontFamily: 'Montserrat-SemiBold',
                fontSize: 14.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.black54,
            child: TextFormField(
              cursorColor: Colors.white,
              obscureText: obscureText,
              controller: controller,
              validator: validator,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                  ),
                  gapPadding: 0.0,
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                  ),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat-SemiBold',
                  fontSize: 14.0,
                  color: Colors.white60,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildSubmitButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 150,
      child: RaisedButton(
        elevation: 8.0,
        color: materialAccentColor,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: DxTextWhiteM(
            'Register',mBold: true,mSize: 18,
          ),
        ),
      ),
    );
  }
}
