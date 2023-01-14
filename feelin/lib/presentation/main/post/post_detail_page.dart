import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/navigation/nav_bar_item.dart';
import 'package:music_sns/application/navigation/navigation_cubit.dart';
import 'package:music_sns/application/post/post_form/post_form_bloc.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/main/root_page.dart';

import '../../../application/profile/profile_bloc.dart';
import '../../../domain/custom/marquee.dart';
import '../../../domain/play/playlist.dart';
import '../../../domain/play/track.dart';
import '../../common/next_button.dart';
import '../../style/colors.dart';

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
                (f) => _showSnackBar(context, f.toString()),
                (_) => {
                //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(widget.playlist.tracks[0].id.toString()))),
                // context.read<ProfileBloc>().add(const ProfileEvent.myProfileRequest()),
                //   context.read<ProfileBloc>().add(const ProfileEvent.myPageRequest(0)),
                Navigator.pop(context, true),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
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
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
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
                      maxLength: 200,
                      minLines: 4,
                      maxLines: 5,
                      expands: false,
                      keyboardType: TextInputType.multiline,
                      controller: _contentTextController,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        counterText: '',
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
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: BlocBuilder<PostFormBloc, PostFormState>(
                      builder: (context, state) {
                        return NextButton(disabled: !state.title.isValid(), function: (){
                          context.read<PostFormBloc>().add(const PostFormEvent.submitted());
                        });
                      }
                    ),
                  )
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