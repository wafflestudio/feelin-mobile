import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../application/auth/auth/auth_bloc.dart';
import '../../../../application/edit/edit_profile_form/edit_profile_form_bloc.dart';
import '../../../../application/profile/profile_bloc.dart';
import '../../../../application/streaming/connect_streaming_bloc.dart';
import '../../../../domain/profile/profile.dart';
import '../../../../injection.dart';
import '../../../edit/profile/edit_profile_page.dart';
import '../../../setting/setting_app.dart';
import '../../../streaming/connect_streaming_page.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget{

  final storage = const FlutterSecureStorage();
  final bool isRoot;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  const ProfileAppBar({Key? key, required this.isRoot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
        return AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          title: Text(state.profile.username,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          actions: isRoot ? [IconButton(onPressed: () async{
            final newProfile = await showModalBottomSheet<Profile>(
              context: context,
              useRootNavigator: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: TextButton(onPressed: (){
                            Navigator.push(context, CupertinoPageRoute(
                              builder: (context){
                                return BlocProvider(
                                    create: (context) => getIt<ConnectStreamingBloc>(),
                                    child: ConnectStreamingPage());
                              },
                            ),
                            );
                          }, child: const Text('Connect to streaming service', style: TextStyle(color: Colors.black, fontSize: 16),))),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: TextButton(onPressed: () async {
                          Profile newProfile = await Navigator.push(context, CupertinoPageRoute(
                              builder: (context){
                                return BlocProvider(
                                    create: (context) => getIt<EditProfileFormBloc>(),
                                    child: EditProfilePage(profile: state.profile));
                              }
                          ),
                          );
                        }, child: const Text('Edit Profile', style: TextStyle(color: Colors.black, fontSize: 16),)),
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: TextButton(onPressed: (){
                            Navigator.push(context, CupertinoPageRoute(
                                builder: (context){
                                  return BlocProvider(
                                      create: (context) => context.read<AuthBloc>(),
                                      child: const SettingApp());
                                }
                            ),
                            );
                          }, child: const Text('Settings', style: TextStyle(color: Colors.black, fontSize: 16),))),
                    ],
                  ),
                );
              },
            );
          }, icon: const Icon(Icons.table_rows))] : [],
        );
      }
    );
  }
}