import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../application/auth/auth/auth_bloc.dart';
import '../../../../application/edit/edit_profile_form/edit_profile_form_bloc.dart';
import '../../../../application/profile/profile_bloc.dart';
import '../../../../application/streaming/connect/connect_streaming_bloc.dart';
import '../../../../application/streaming/streaming_bloc.dart';
import '../../../../domain/profile/profile.dart';
import '../../../../domain/streaming/vendor.dart';
import '../../../../injection.dart';
import '../../../edit/profile/edit_profile_page.dart';
import '../../../setting/setting_app.dart';
import '../../../streaming/connect_streaming_page.dart';
import '../../../style/colors.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget{

  final bool isRoot;
  final Function function;
  final Function onRefresh;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  const ProfileAppBar({Key? key, required this.isRoot, required this.function, required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
        return AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          title: GestureDetector(
            onTap: (){
              function();
            },
            child: Container(
              width: 240,
              height: preferredSize.height,
              child: Center(
                child: Text(state.profile.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
          actions: isRoot ? [IconButton(onPressed: () async{
            final isConnected = await showModalBottomSheet<bool?>(
              context: context,
              useRootNavigator: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (BuildContext context2) {
                context.read<StreamingBloc>().add(StreamingEvent.getMyAccount());
                return Container(
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      if(!context.watch<StreamingBloc>().state.isConnected)SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: TextButton(onPressed: (){
                            Navigator.pop(context2);
                            Navigator.push(context, CupertinoPageRoute(
                              builder: (context){
                                return BlocProvider(
                                    create: (context) => getIt<ConnectStreamingBloc>(),
                                    child: ConnectStreamingPage());
                              },
                            ),
                            ).then((value) {
                              if(value != null){
                                print('dffffffffffffffff');
                                Future.delayed(const Duration(milliseconds: 150), () {
                                  context.read<StreamingBloc>().add(StreamingEvent.getMyAccount());
                                });
                                Future.delayed(const Duration(milliseconds: 300), () {
                                  context.read<StreamingBloc>().add(StreamingEvent.getMyAccount());
                                });
                                Future.delayed(const Duration(milliseconds: 500), () {
                                  context.read<StreamingBloc>().add(StreamingEvent.getMyAccount());
                                });
                              }
                            });
                          }, child: const Text('Connect to streaming service', style: TextStyle(color: Colors.black, fontSize: 16),),
                          ),
                      ),
                      if(context.watch<StreamingBloc>().state.isConnected) SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: TextButton(onPressed: (){
                          Navigator.pop(context2);
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
                                          'You are connected to ${vendorName[context.watch<StreamingBloc>().state.vendor]}.\nWould you like to disconnect?',
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
                        }, child: const Text('Disconnect Streaming account', style: TextStyle(color: Colors.black, fontSize: 16),),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: TextButton(onPressed: () async {
                          Navigator.pop(context2);
                          Navigator.push(context, CupertinoPageRoute(
                              builder: (context){
                                return BlocProvider(
                                    create: (context) => getIt<EditProfileFormBloc>(),
                                    child: EditProfilePage(profile: state.profile));
                              }
                          ),
                          ).then((value) {
                            if(value != null){
                              onRefresh();
                            }
                          });
                        }, child: const Text('Edit Profile', style: TextStyle(color: Colors.black, fontSize: 16),)),
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: TextButton(onPressed: (){
                            Navigator.pop(context2);
                            Navigator.push(context, CupertinoPageRoute(
                                builder: (context){
                                  return BlocProvider.value(
                                      value: context.read<AuthBloc>(),
                                      child: const SettingApp());
                                }
                            ),
                            );
                          }, child: const Text('Settings', style: TextStyle(color: Colors.black, fontSize: 16),))),
                    ],
                  ),
                );
              },
            ).then((value) {
              if(value != null) {
                print('dffffffffffffffff');
                context.read<StreamingBloc>().add(StreamingEvent.getMyAccount());
              }
            });
            if(isConnected != null){
              print('dffffffffffffffff');
              context.read<StreamingBloc>().add(StreamingEvent.getMyAccount());
            }
          }, icon: const Icon(Icons.table_rows))] : [],
        );
      }
    );
  }
}