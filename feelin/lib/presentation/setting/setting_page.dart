import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/streaming/streaming_bloc.dart';
import 'package:music_sns/domain/streaming/vendor.dart';
import 'package:music_sns/presentation/setting/our_email_page.dart';
import 'package:music_sns/presentation/style/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/auth/auth/auth_bloc.dart';
import '../../application/streaming/connect/connect_streaming_bloc.dart';
import '../../injection.dart';
import '../streaming/connect_streaming_page.dart';

class SettingPage extends StatelessWidget{
  const SettingPage({Key? key,}) : super(key: key);
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context){
    final streamingBloc = context.watch<StreamingBloc>();
    if(!context.watch<StreamingBloc>().state.isConnected){
      context.read<StreamingBloc>().add(StreamingEvent.getMyAccount());
    }
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text('About'),
          button(string: 'Privacy Policy', function: () async {
            final url = Uri.parse('https://feelin.wafflestudio.com/privacy-policy.html');
            if (await canLaunchUrl(url)) {
            launchUrl(url, mode: LaunchMode.externalApplication);
            }
          }),
          button(string: 'Terms of Use', function: () async {
            final url = Uri.parse('https://feelin.wafflestudio.com/terms-of-use.html');
            if (await canLaunchUrl(url)) {
            launchUrl(url,  mode: LaunchMode.externalApplication);
            }
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
            Navigator.push(context, CupertinoPageRoute(
              builder: (context){
                return const OurEmailPage();
              },
            ),
            );
          }),
          const SizedBox(height: 20,),
          text('Logins'),
          if(!context.watch<StreamingBloc>().state.isConnected) button(string: 'Connect Streaming account', function: (){
            Navigator.push(context, CupertinoPageRoute(
              builder: (context){
                return BlocProvider(
                    create: (context) => getIt<ConnectStreamingBloc>(),
                    child: ConnectStreamingPage());
              },
            ),
            ).then((value) {
              if(value != null){
                context.read<StreamingBloc>().add(StreamingEvent.getMyAccount());
              }
            });
          }),
          if(context.watch<StreamingBloc>().state.isConnected) button(string: 'Disconnect Streaming account', function: (){
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
                            'Disconnect',
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text(
                            'You are connected to ${vendorName[streamingBloc.state.vendor]}.\nWould you like to disconnect?',
                            style: TextStyle(fontSize: 14, ),
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                            context.read<StreamingBloc>().add(const StreamingEvent.disconnectMyAccount());
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
                                'Disconnect',
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
          button(string: 'Delete Account', function: (){
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
                            'Delete Account',
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
                            'If you delete the account, you cannot recover it again. Are you sure you want to delete it?',
                            textAlign: TextAlign.center,
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
                            width: 180,
                            height: 40,
                            child: Center(
                              child: Text(
                                'Delete Account',
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