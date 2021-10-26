import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tt_league/Model/userModel.dart';
import 'package:tt_league/cubit/authentication/forgotPassword/forgot_password_cubit.dart';
import 'package:tt_league/helper/app_utilities/appImages.dart';
import 'package:tt_league/helper/app_utilities/app_theme.dart';
import 'package:tt_league/helper/app_utilities/dx_app_decoration.dart';
import 'package:tt_league/helper/app_utilities/method_utils.dart';
import 'package:tt_league/screen/customWidget/app_circular_loader.dart';
import 'package:tt_league/screen/customWidget/dxWidget/dx_text.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool passHidden = true;
  bool cPassHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: materialPrimaryColor,
        appBar: AppBar(
            toolbarHeight: 0.0,
            backwardsCompatibility: false,
            backgroundColor: Colors.transparent),
        body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            builder: (BuildContext context, state) {
          if (state is ForgotPasswordLoaded) {
            return body();
          }
          if (state is ForgotPasswordError) {
            return body();
          }
          if (state is ForgotPasswordInitial) {
            return body();
          }
          if (state is ForgotPasswordLoading) {
            return Stack(
              children: [body(), AppLoaderProgress()],
            );
          }
          return Container();
        }, listener: (BuildContext context, state) {
          if (state is ForgotPasswordLoaded) {
            MethodUtils.showSnackBarGK(_scaffoldKey, "${state.msg}");
          }
          if (state is ForgotPasswordError) {
            MethodUtils.showSnackBarGK(_scaffoldKey, "${state.error}");
          }
        }));
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(48, 40, 48, 20),
            child: Image.asset(AppImages.logo),
          ),
          Container(
            // color: Colors.blue,
            padding: const EdgeInsets.fromLTRB(48, 0, 48, 30),
            child: DxTextYellow(
              'Enter the email ID associated with your account for password reset',
              textAlign: TextAlign.center,
              mBold: true,
              mSize: 20,
            ),
          ),
          buildTextField(
              heading: "Enter Email Id",
              hintText: 'Email Id',
              controller: emailController,
              obscureText: false,
              inputFormatters: [
                LengthLimitingTextInputFormatter(35),
              ]),
          SizedBox(height: 20),
          buildTextField(
              heading: "New Password",
              hintText: 'New Password',
              controller: passController,
              obscureText: passHidden,
              eyeShow: true,
              suffixIcon: IconButton(
                color: Colors.white,
                icon: passHidden ? Icon(Icons.visibility_off):Icon(Icons.visibility),
                onPressed: (){
                  setState(() {
                    passHidden=!passHidden;
                  });
                },
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ]),
          SizedBox(height: 20),
          buildTextField(
              heading: "Confirm Password",
              hintText: 'Confirm Password',
              controller: confirmPassController,
              obscureText: cPassHidden,
              eyeShow: true,
              suffixIcon: IconButton(
                color: Colors.white,
                icon: cPassHidden ? Icon(Icons.visibility_off):Icon(Icons.visibility),
                onPressed: (){
                  setState(() {
                    cPassHidden=!cPassHidden;
                  });
                },
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(20),
              ]),
          SizedBox(height: 20),
          buildSubmitButton(context),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Padding buildTextField(
      {bool obscureText = false,
      String? heading,
      String? hintText,
      String? Function(String?)? validator,
      TextEditingController? controller,
      List<TextInputFormatter>? inputFormatters,
        bool eyeShow = false,
        Widget? suffixIcon,
      TextInputType? keyboardType = TextInputType.emailAddress}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading!,
            style: AppStyles.getTextStyleGreyMB(false, 16),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.black54,
            child: TextFormField(
              cursorColor: Colors.white,
              obscureText: obscureText,
              controller: controller,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters!,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon:suffixIcon,
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
                    color: Colors.grey,
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
        onPressed: () {
          UserModel userModel = UserModel(
              emailid: emailController.text,
              keycol: passController.text,
              cPass: confirmPassController.text);
          BlocProvider.of<ForgotPasswordCubit>(context)
              .validation(userModel, context);
        },
        color: materialAccentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: DxTextWhiteM(
            'Reset',
            mBold: true,
            mSize: 18,
          ),
        ),
      ),
    );
  }
}
