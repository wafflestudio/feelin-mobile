
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_sns/presentation/streaming/platform_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../application/post/post_form/post_form_bloc.dart';
import '../../common/custom_tab_indicator.dart';
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
                        const CustomSnackBar.error(message: 'playlist does not exist.')
                    ),
                    invalidUrl: (_) => showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(message: 'Please enter the valid Playlist URL.')
                    ),
                    notSupportingVendor: (_)=>showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(message: 'This streaming platform is not yet supported.')
                    ),
                    orElse: ()=>showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(message: 'server error')
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
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxHeight: 260),
                    padding: const EdgeInsets.symmetric(horizontal: 28,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: NextButton(disabled: link.isEmpty,
                  isLoading: context.watch<PostFormBloc>().state.isFetching,
                  function: (){
                    onSubmitted();
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
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
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return DefaultTabController(
          length: 2,
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: TabBar(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      isScrollable: false,
                      physics: const BouncingScrollPhysics(),
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      unselectedLabelColor: FeelinColorFamily.gray500,
                      indicatorColor: Colors.black,
                      indicator: const CustomTabIndicator(),
                      indicatorWeight: 2,
                  tabs: [
                    Tab(
                      child: SvgPicture.asset('assets/icons/spotify_icon.svg',
                        width: 32,
                        height: 32,
                      ),
                    ),
                    Tab(
                      child: Image.asset('assets/icons/apple_music_icon.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 120,
                  width: 400,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height - 210,
                              child: const AspectRatio(
                                  aspectRatio: 0.6,
                                  child: WebViewPage(url: 'https://feelin.wafflestudio.com/guide/spotify'),
                              ),
                          ),
                          const Spacer(),
                          PlatformButton(function: (){
                            LaunchApp.openApp(
                              androidPackageName: 'com.spotify.music',
                              iosUrlScheme: 'spotify://',
                              appStoreLink: 'https://apps.apple.com/us/app/spotify-music-and-podcasts/id324684580',
                              openStore: true,
                            );
                          }, label: 'Open Spotify', icon: SvgPicture.asset('assets/icons/spotify_icon.svg',
                            width: 32,
                            height: 32,
                          ), isBlack : true),
                          const SizedBox(height: 30,),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 210,
                            child: const AspectRatio(
                                aspectRatio: 0.6,
                                child: WebViewPage(url: 'https://feelin.wafflestudio.com/guide/applemusic')),
                          ),
                          const Spacer(),
                          PlatformButton(function: (){
                            LaunchApp.openApp(
                              androidPackageName: 'com.apple.android.music',
                              iosUrlScheme: 'music://',
                              appStoreLink: 'https://apps.apple.com/us/app/apple-music/id1108187390',
                              openStore: true,
                            );
                          }, label: 'Open Apple Music', icon: Image.asset('assets/icons/apple_music_icon.png',
                            width: 32,
                            height: 32,
                          ), isBlack : true),
                          const SizedBox(height: 30,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}