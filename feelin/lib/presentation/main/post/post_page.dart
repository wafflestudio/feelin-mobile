
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:music_sns/application/post/post_detail_form/post_detail_form_bloc.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/main/post/fetchedPlaylistPreview.dart';
import 'package:music_sns/presentation/main/post/open_your_music_app_button.dart';
import 'package:music_sns/presentation/main/post/post_detail_page.dart';

import '../../../application/post/post_form/post_form_bloc.dart';
import '../../common/next_button.dart';
import '../../style/colors.dart';

class PostPage extends StatefulWidget{
  final Function goToNext;

  const PostPage({Key? key, required this.goToNext, }) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}
class _PostPageState extends State<PostPage>{
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();
  final storage = const FlutterSecureStorage();
  String link = '';

  final TextEditingController _linkTextController = TextEditingController();

  @override
  void dispose() {
    _linkTextController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    storage.write(key: 'MusicPlatform', value: 'Flo');
  }


  @override
  Widget build(BuildContext context){
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return _postForm(screenSize);
  }

  Widget _postForm(Size size){
    return BlocListener<PostFormBloc,PostFormState>(
      listener: (context, state){
        state.fetchFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (f) => null,
                (playlist) => {
                  widget.goToNext()
            },
          ),
        );
      },
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 12,),
                  BlocBuilder<PostFormBloc, PostFormState>(
                    builder: (context, state) {
                      return TextFormField(
                        controller: _linkTextController,
                        decoration: InputDecoration(
                          hintText: 'Playlist URL',
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: FeelinColorFamily.grayscaleGray1, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: FeelinColorFamily.blueCore, width: 0.5),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Colors.red, width: 0.5),
                          ),
                        ),
                        validator: (_) => state.fetchFailureOrSuccessOption.fold(
                                    () => null,
                                    (failureOrSuccess) => failureOrSuccess.fold(
                                        (f) => f.maybeMap(
                                      noSuchPlaylistExists: (_) =>'playlist does not exist.',
                                      invalidUrl: (_) => 'Please enter the valid Playlist URL.',
                                      orElse: () => 'server error',),
                                        (playlist) => null
                                )
                            ),
                        onChanged: (value) {
                          context
                            .read<PostFormBloc>()
                            .add(PostFormEvent.urlChanged(value));
                          setState(() {
                            link = value;
                          });
                          },
                      );
                    }
                  ),
                  const SizedBox(height: 12,),
                  Tooltip(
                    key: _tooltipKey,
                    margin: const EdgeInsets.symmetric(horizontal: 10,),
                    triggerMode: TooltipTriggerMode.tap,
                    showDuration: const Duration(seconds: 3),
                    message: '[Flo] 보관함 > 내 리스트 > 리스트 선택 > 더보기 > 공유하기를 통해 링크를 복사해보세요!',
                    preferBelow: true,
                    height: 40,
                    textStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white
                    ),
                    child: Text(
                      'How can I get the playlist URL?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: FeelinColorFamily.blueCore,
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<PostFormBloc, PostFormState>(builder: (context, state){
                if(state.isFetching) {
                  return const CupertinoActivityIndicator(radius: 18,);
                }
                else {
                  return const Offstage();
                }
              }),
              NextButton(disabled: link.isEmpty, function: (){
                context.read<PostFormBloc>().add(const PostFormEvent.fetchRequested());

              }, margin: const EdgeInsets.all(0),)
            ],
          ),
        ),
      ),
    );
  }


}