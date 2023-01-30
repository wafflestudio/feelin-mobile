import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/main/profile/report_result_modal.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../application/auth/auth/auth_bloc.dart';
import '../../../../application/edit/edit_profile_form/edit_profile_form_bloc.dart';
import '../../../../application/profile/profile_bloc.dart';
import '../../../../application/streaming/connect/connect_streaming_bloc.dart';
import '../../../../application/streaming/streaming_bloc.dart';
import '../../../../domain/streaming/vendor.dart';
import '../../../../injection.dart';
import '../../../edit/profile/edit_profile_page.dart';
import '../../../setting/setting_app.dart';
import '../../../streaming/connect_streaming_page.dart';
import '../../../style/colors.dart';
import '../report_bottom_modal.dart';

class ProfileAppBar extends StatefulWidget with PreferredSizeWidget{

  final bool isRoot;
  final Function function;
  final Function onRefresh;
  final Function onBack;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  const ProfileAppBar({Key? key, required this.isRoot, required this.function, required this.onRefresh, required this.onBack}) : super(key: key);

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state){
        state.reportFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (f) => null,
                (_) {showModalBottomSheet<void>(
                context: context,
                useRootNavigator: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (context) => ReportResultBottomModal(username: state.profile.username, function: (){
                  showBlockModal(context);
                })
            );
            context.read<ProfileBloc>().add(const ProfileEvent.resetStateRequest());
            },
          ),
        );
        state.blockFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) {failureOrSuccess.fold(
                (f) => f.maybeMap(
              alreadyBlocked: (_)=>showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.error(message: 'You have already blocked this user.'),
              ),
              orElse: ()=>showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.error(message: 'Server error'),
              ),
            ),
                (_) => showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(message: '${state.profile.username} has been blocked. You can unblock this user in the settings.'),
            ),
          );
              context.read<ProfileBloc>().add(const ProfileEvent.resetStateRequest());
              }
        );
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
          return AppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            leading: widget.isRoot ? null : IconButton(
              onPressed: () {
                widget.onBack();
              },
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            backgroundColor: Colors.transparent,
            title: GestureDetector(
              onTap: (){
                widget.function();
              },
              child: SizedBox(
                width: 250,
                height: widget.preferredSize.height,
                child: Center(
                  child: AutoSizeText(state.profile.username,
                    minFontSize: 14,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            centerTitle: true,
            actions: [if(widget.isRoot) IconButton(onPressed: () async{
              await showModalBottomSheet<bool?>(
                context: context,
                useRootNavigator: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context2) {
                  context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
                  return SizedBox(
                    height: 220,
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
                                      child: const ConnectStreamingPage());
                                },
                              ),
                              ).then((value) {
                                if(value != null){
                                  Future.delayed(const Duration(milliseconds: 150), () {
                                    context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
                                  });
                                  Future.delayed(const Duration(milliseconds: 300), () {
                                    context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
                                  });
                                  Future.delayed(const Duration(milliseconds: 500), () {
                                    context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
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
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: const Size(30, 26),
                                              alignment: Alignment.centerRight,
                                            ),
                                            onPressed: () => Navigator.of(context).pop(),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(fontSize: 16, color: FeelinColorFamily.gray600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                        child: Center(
                                          child: Text(
                                            'You are connected to ${vendorName[context.watch<StreamingBloc>().state.vendor]}.\nWould you like to disconnect?',
                                            style: const TextStyle(fontSize: 14, ),
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
                                widget.onRefresh();
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
              );
            }, icon: const Icon(Icons.table_rows)),
              if(!state.isLoading && state.profile.id != context.watch<AuthBloc>().state.id)
                IconButton(onPressed: () async{
                  await showModalBottomSheet<bool?>(
                      context: context,
                      useRootNavigator: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (BuildContext context2) {
                        context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
                        return SizedBox(
                          height: 160,
                          child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                    width: double.infinity,
                                    height: 60,
                                    child: TextButton(onPressed: (){
                                      Navigator.pop(context2);
                                      showModalBottomSheet<void>(
                                        context: context,
                                        useRootNavigator: true,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        builder: (context2) {
                                          return BlocProvider.value(
                                              value: context.read<ProfileBloc>(),
                                              child: const ReportBottomModal());
                                        },
                                      );
                                    }
                                        , child: Text('Report', style: TextStyle(color: FeelinColorFamily.errorDark, fontSize: 16),))),
                                SizedBox(
                                    width: double.infinity,
                                    height: 60,
                                    child: TextButton(onPressed: (){
                                      Navigator.pop(context2);
                                      showBlockModal(context);
                                      }
                                        , child: Text('Block', style: TextStyle(color: FeelinColorFamily.errorDark, fontSize: 16),))),
                              ]
                          ),
                        );
                      }
                  );
                }, icon: const Icon(Icons.more_vert)
                ),
            ],
          );
        }
      ),
    );
  }

  void showBlockModal(context2){
    showModalBottomSheet<void>(
      context: context2,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context2) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 24, top: 24, right: 18, bottom: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Block User',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: FeelinColorFamily.gray900),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(30, 26),
                      alignment: Alignment.centerRight,
                    ),
                    onPressed: () => Navigator.of(context2).pop(),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, color: FeelinColorFamily.redPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'Are you sure you want to block the user?',
                    style: TextStyle(fontSize: 14, ),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: (){
                    context.read<ProfileBloc>().add(const ProfileEvent.blockRequest());
                    Navigator.pop(context2);
                  },
                  child: Text(
                    'Block',
                    style: TextStyle(fontSize: 16, color: FeelinColorFamily.errorDark),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}