import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/post/post_form/post_form_bloc.dart';
import 'package:music_sns/presentation/main/post/post_complete.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../domain/play/playlist.dart';
import '../../../domain/post/max_lines_input_formatters.dart';

class PostDetailPage extends StatefulWidget{
  const PostDetailPage({Key? key,}) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();
  List<int> orderList = List.empty();
  late Playlist playlist;


  @override
  void initState(){
    super.initState();
    playlist = context.read<PostFormBloc>().state.playlist;
    context.read<PostFormBloc>().add(PostFormEvent.titleChanged(playlist.title));
    _titleTextController.text = playlist.title;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return Container(
      child: _postDetailForm(screenSize),
    );
  }

  Widget _postDetailForm(Size size){

    return BlocListener<PostFormBloc, PostFormState>(
      listener: (context, state){
        state.postFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (f) => showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(message: f.toString())
                ),
                (post) => {
                //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(widget.playlist.tracks[0].id.toString()))),
                // context.read<ProfileBloc>().add(const ProfileEvent.myProfileRequest()),
                //   context.read<ProfileBloc>().add(const ProfileEvent.myPageRequest(0)),
                  Navigator.pop(context, true),
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context){
                      return PostCompletePage(post: post);
                    },
                  ),
                  ),
            },
          ),

        );
      },
      child: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Material(
                    shadowColor: Colors.black,
                    elevation: 8,
                    child: Image(
                      image: CachedNetworkImageProvider(context.read<PostFormBloc>().state.playlistPreview.thumbnail),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                    child: TextFormField(
                      maxLength: 100,
                      minLines: 1,
                      maxLines: 1,
                      inputFormatters: [
                        MaxLinesInputFormatters(1),
                      ],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        letterSpacing: -0.41,
                      ),
                      controller: _titleTextController,
                      decoration: const InputDecoration(
                        hintText: 'Title',
                        counterText: '',
                        isDense: true,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      validator: (_) =>
                          context.read<PostFormBloc>().state.title.value.fold(
                                (f) => f.maybeMap(
                              orElse: () => null,
                            ),
                                (_) => null,
                          ),
                      onChanged: (value) => context
                          .read<PostFormBloc>()
                          .add(PostFormEvent.titleChanged(value)),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 100,
                    child: TextFormField(
                      maxLength: 1000,
                      minLines: 1,
                      maxLines: 4,
                      expands: false,
                      keyboardType: TextInputType.multiline,
                      controller: _contentTextController,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: -0.41,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Description',
                        counterText: '',
                        isDense: true,
                      ),
                      validator: (_) =>
                          context.read<PostFormBloc>().state.content.value.fold(
                                (f) => f.maybeMap(
                              orElse: () => null,
                            ),
                                (_) => null,
                          ),
                      onChanged: (value) => context
                          .read<PostFormBloc>()
                          .add(PostFormEvent.contentChanged(value)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}