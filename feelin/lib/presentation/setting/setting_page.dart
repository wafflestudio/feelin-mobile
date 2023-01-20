import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../application/auth/auth/auth_bloc.dart';
import '../../application/streaming/connect_streaming_bloc.dart';
import '../../injection.dart';
import '../streaming/connect_streaming_page.dart';

class SettingPage extends StatelessWidget{
  const SettingPage({Key? key,}) : super(key: key);
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text('About'),
          button(string: 'Privacy Policy', function: (){

          }),
          button(string: 'Terms of Use', function: (){

          }),
          button(string: 'Open source libraries', function: (){
            Navigator.push(context, CupertinoPageRoute(
                builder: (context){
              return const LicensePage(applicationVersion: '1.0.0',);
            },
            ),
            );
          }),
          button(string: 'Contact Us', function: (){

          }),
          const SizedBox(height: 20,),
          text('Logins'),
          button(string: 'Connect Streaming account', function: (){
            Navigator.push(context, CupertinoPageRoute(
              builder: (context){
                return BlocProvider(
                    create: (context) => getIt<ConnectStreamingBloc>(),
                    child: ConnectStreamingPage());
              },
            ),
            );
          }),
          button(string: 'Logout', function: (){
            showModalBottomSheet<void>(
              context: context,
              useRootNavigator: true,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 24, top: 24, right: 18, bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Log Out',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FeelinColorFamily.gray900),
                          ),
                          TextButton(
                            child: Text(
                              'Cancel',
                              style: TextStyle(fontSize: 16, color: FeelinColorFamily.gray600,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(30, 26),
                              alignment: Alignment.centerRight,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text(
                            'Are you sure you want to log out?',
                            style: TextStyle(fontSize: 14, ),
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: (){
                            storage.deleteAll();
                            context.read<AuthBloc>().add(const AuthEvent.submitted());
                            Navigator.of(context).popUntil((route) => route.isFirst);
                          },
                          child: Container(
                            //color: FeelinColorFamily.gray50,
                            decoration: BoxDecoration(
                              color: FeelinColorFamily.gray50,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            width: 100,
                            height: 40,
                            child: Center(
                              child: Text(
                                'Logout',
                                style: TextStyle(fontSize: 16, color: FeelinColorFamily.redPrimary),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }, color: FeelinColorFamily.redPrimary),
        ],
      ),
    );
  }

  Widget text(String string){
    return Text(
      string,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black, letterSpacing: -0.41),
    );
  }

  Widget button({required String string, required Function function, Color? color,}){
    return TextButton(
        onPressed: ()=>function(),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              string,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.41,
                color: color ?? Colors.black,
              ),
            ),
          ),
        ),
    );
  }
}