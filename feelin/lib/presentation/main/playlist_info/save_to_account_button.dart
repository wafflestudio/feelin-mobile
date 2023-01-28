import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_sns/application/info/playlist_info_bloc.dart';
import 'package:music_sns/application/streaming/streaming_bloc.dart';
import 'package:music_sns/domain/streaming/vendor.dart';
import 'package:music_sns/presentation/style/colors.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../../application/streaming/connect/connect_streaming_bloc.dart';
import '../../../injection.dart';
import '../../common/bouncing_widget.dart';
import '../../streaming/connect_streaming_page.dart';

class SaveToAccountButton extends StatefulWidget{
  const SaveToAccountButton({Key? key,}) : super(key: key);

  @override
  State<SaveToAccountButton> createState() => SaveToAccountButtonState();
}

class SaveToAccountButtonState extends State<SaveToAccountButton> {
  final storage = const FlutterSecureStorage();
  String? token;
  String? id;

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _async();
    });
  }

  _async() async{
    token = await storage.read(key: "token");
    id = await storage.read(key: 'vendor');
  }

  @override
  Widget build(BuildContext context) {
    if(!context.watch<StreamingBloc>().state.isConnected){
      context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
    }
    return BlocListener<PlaylistInfoBloc, PlaylistInfoState>(
      listener: (context, state){
        state.saveFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (f) => showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.error(
                    backgroundColor: FeelinColorFamily.errorPrimary,
                    icon: const Icon(Icons.music_note_rounded, color: Colors.transparent,),
                    message:
                    'Server error',
                  ),
                ),
                (url1) async {
                  // final url = Uri.parse(url1.url);
                  // if (await canLaunchUrl(url)) {
                  //   launchUrl(url, mode: LaunchMode.externalApplication);
                  // }
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.success(
                      backgroundColor: FeelinColorFamily.redPrimary,
                      icon: const Icon(Icons.music_note_rounded, color: Colors.transparent,),
                      message:
                      'The playlist has been saved successfully.',
                    ),
                  );
            },
          ),
        );
      },
      child: BlocBuilder<StreamingBloc, StreamingState>(
        builder: (context, state) {
          return BouncingWidget(
            disabled: false,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 24,
              height: 56,
              child: FloatingActionButton.extended(
                onPressed: (){
                  if(state.isConnected){
                    context.read<PlaylistInfoBloc>().add(PlaylistInfoEvent.saveRequest(state.vendorId));
                  }else{
                    Navigator.push(context, CupertinoPageRoute(
                      builder: (context){
                        return BlocProvider(
                            create: (context) => getIt<ConnectStreamingBloc>(),
                            child: const ConnectStreamingPage());
                      },
                    ),
                    ).then((value) {
                      if(value != null){
                        context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
                      }
                    });
                  }
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                hoverColor: Colors.transparent,
                icon: !state.isConnected ? null :
                state.vendor == Vendor.spotify ? SvgPicture.asset('assets/icons/spotify_icon.svg',
                  width: 32,
                  height: 32,
                ) :
                Image.asset('assets/icons/apple_music_icon.png',
                  width: 32,
                  height: 32,
                ),
                elevation: 4,
                highlightElevation: 4,
                hoverElevation: 4,
                focusElevation: 4,
                disabledElevation: 4,
                //shape: RoundedRectangleBorder(side: BorderSide(),borderRadius: BorderRadius.circular(28)),
                label: const Text('Save to account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: -0.41),),),
            ),
          );
        }
      ),
    );
  }
}