
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../application/post/post_form/post_form_bloc.dart';
import '../../common/next_button.dart';
import '../../style/colors.dart';
import 'webview_page.dart';

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
  bool navigated = true;

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

  void onSubmitted(){
    navigated = false;
    context.read<PostFormBloc>().add(const PostFormEvent.fetchRequested());
  }

  void showSnackBar(String text){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: FeelinColorFamily.errorPrimary,
      content: Text(text),
    ));
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
                (f) => f.maybeMap(
                    noSuchPlaylistExists: (_) =>showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(message: 'playlist does not exist.')
                    ),
                    invalidUrl: (_) => showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(message: 'Please enter the valid Playlist URL.')
                    ),
                    notSupportingVendor: (_)=>showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(message: 'This streaming platform is not yet supported.')
                    ),
                    orElse: ()=>showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(message: 'server error')
                    )),
                (playlist) {
                  if(!navigated) {
                    navigated = true;
                    widget.goToNext();
                  }
            },
          ),
        );
      },
      child: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200),
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
                            onFieldSubmitted: (_){if(link.isNotEmpty){
                              onSubmitted();
                              FocusScope.of(context).unfocus();
                            }},
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: 'Playlist URL',
                              isDense: true,
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
                      GestureDetector(
                        onTap: (){
                          showGuide();
                        },
                        child: Text(
                          'How can I get the playlist URL?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: FeelinColorFamily.red500,
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
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: NextButton(disabled: link.isEmpty, function: (){
              onSubmitted();
              FocusScope.of(context).unfocus();
            },),
                ))
          ],
        ),
      ),
    );
  }

  void showGuide(){
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 200,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WebViewPage(url: 'https://feelin-dev.wafflestudio.com/guide/applemusic/'),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget openAppButton(){
    
  }
}