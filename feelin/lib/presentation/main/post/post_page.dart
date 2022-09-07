
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/post/post_detail_form/post_detail_form_bloc.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/main/post/post_detail_page.dart';

import '../../../application/post/post_form/post_form_bloc.dart';

class PostPage extends StatefulWidget{
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}
class _PostPageState extends State<PostPage>{
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  final TextEditingController _linkTextController = TextEditingController();

  @override
  void dispose() {
    _linkTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return Stack(
        children : [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              _postForm(screenSize),
              _openYourMusicAppButton(screenSize),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                child: FloatingActionButton(
                  backgroundColor: const Color(0xff00C19C),
                  foregroundColor: Colors.white,
                  heroTag: null,
                  onPressed: (){
                    _tooltipKey.currentState?.ensureTooltipVisible();
                  },
                  child: const Icon(Icons.question_mark),
                ),
              ),
            ),
          ),
        ]
    );
  }

  Widget _postForm(Size size){
    return BlocListener<PostFormBloc,PostFormState>(
      listener: (context, state){
        state.postFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (f) => null,
                (playlist) => {
              Navigator.push(context,
                MaterialPageRoute(
                    builder: (context){
                      //PostFormState.initial();
                      return BlocProvider(
                          create: (context) => getIt<PostDetailFormBloc>(),
                          child: PostDetailPage(playlist: playlist,));
                    }
                ),
              ),
            },
          ),
        );
      },
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.20),
          child: Column(
            children: [
              Tooltip(
                key: _tooltipKey,
                margin: const EdgeInsets.symmetric(horizontal: 10,),
                triggerMode: TooltipTriggerMode.tap,
                showDuration: const Duration(seconds: 3),
                message: '[Flo] 보관함 > 내 리스트 > 리스트 선택 > 더보기 > 공유하기를 통해 링크를 복사해보세요!',
                preferBelow: false,
                height: 40,
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.white
                ),
                child: const Text(
                  '공유하실 플레이리스트의 링크를 \n입력해주세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff00C19C),
                  ),
                ),
              ),
              const SizedBox(height: 12,),
              TextFormField(
                controller: _linkTextController,
                decoration: const InputDecoration(
                  hintText: '플레이리스트 링크',
                 isDense: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff7DD8C6),
                    ),
                  ),
                ),
                validator: (_) =>
                    context.read<PostFormBloc>().state.playlistUrl.value.fold(
                          (f) => f.maybeMap(
                        orElse: () => null,
                      ),
                          (_) => null,
                    ),
                onChanged: (value) => context
                    .read<PostFormBloc>()
                    .add(PostFormEvent.urlChanged(value)),
              ),
              const SizedBox(height: 12,),
              _postButton(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _postButton(Size size){
    return BlocBuilder<PostFormBloc, PostFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton(
                onPressed: (_linkTextController.text.isNotEmpty)
                    ? () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<PostFormBloc>()
                        .add(const PostFormEvent.submitted());
                  }
                }
                    : null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      const ContinuousRectangleBorder()),
                  elevation: MaterialStateProperty.resolveWith((states) => 0.0),
                  backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                      if (states.contains(MaterialState.disabled)) {
                        return const Color(0xff878FFF);
                      }
                      if (states.contains(MaterialState.pressed)) {
                        return const Color(0xff646ABD);
                      }
                      return const Color(0xff7077D5);
                    },
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text(
                  '플레이리스트 공유',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            state.postFailureOrSuccessOption.fold(
                    () => const Offstage(),
                    (failureOrSuccess) => failureOrSuccess.fold(
                        (f) => f.maybeMap(
                      noSuchPlaylistExists: (_) =>
                      const Text(
                        '! 존재하지 않는 플레이리스트입니다.',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff00C19C),
                        ),
                      ),
                      invalidUrl: (_) =>
                          const Text(
                            '! 올바른 링크를 입력해주세요.',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff00C19C),
                            ),
                          ),
                      orElse: () => const Offstage(),),
                        (playlist) => const Offstage()
                )
            ),
            (state.isSubmitting) ? const Center(child: CircularProgressIndicator(
              color: Color(0xff7077D5),
            )) : const Offstage(),
          ],
        );
      },
    );
  }

  Widget _openYourMusicAppButton(Size size){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.20),
      width: double.infinity,
      height: 38,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 1.0),
            colors: <Color>[
              Color(0xff00C19C),
              Color(0xff7077D5),
            ],
            stops: <double>[0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(2),
        child: OutlinedButton(
          onPressed: () {
            //TODO: open user's Music Platform App.
          }
          ,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const ContinuousRectangleBorder()),
            elevation: MaterialStateProperty.resolveWith((states) => 0.0),
            foregroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return Colors.black;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith(
                  (states) {
                if (states.contains(MaterialState.pressed)) {
                  return const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  );
                }
                return const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                );
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.transparent;
                }
                return Colors.white;
              },
            ),
          ),
          child: const Text(
            "내 플레이리스트 찾기",
          ),
        ),
      ),
    );
  }
}