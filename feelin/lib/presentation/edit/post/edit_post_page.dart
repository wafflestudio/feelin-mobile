import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/style/colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../application/edit/edit_post_form/edit_post_form_bloc.dart';
import '../../../domain/custom/marquee.dart';
import '../../../domain/play/playlist_preview.dart';
import '../../../domain/play/post.dart';
import '../../../domain/post/max_lines_input_formatters.dart';
import 'edit_post_app_bar.dart';

class EditPostPage extends StatefulWidget{
  const EditPostPage({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();



  @override
  void initState(){
    super.initState();
    context.read<EditPostFormBloc>().add(EditPostFormEvent.idChanged(widget.post.id));
    context.read<EditPostFormBloc>().add(EditPostFormEvent.titleChanged(widget.post.title));
    context.read<EditPostFormBloc>().add(EditPostFormEvent.contentChanged(widget.post.content));
    PlaylistPreview playlistPreview = context.read<EditPostFormBloc>().state.playlistPreview;
    playlistPreview.thumbnail = widget.post.playlist.thumbnail!;
    playlistPreview.order = List.generate(widget.post.playlist.tracks!.length, (index) => index+1).join(' ');
    context.read<EditPostFormBloc>().add(EditPostFormEvent.previewChanged(playlistPreview));
    _titleTextController.text = widget.post.title;
    _contentTextController.text = widget.post.content;
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _contentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return Scaffold(
      extendBody: true,
      key: widget.key,
      appBar: const EditPostAppBar(),
      body: SafeArea(
        bottom: false,
        maintainBottomViewPadding: true,
        child: Container(
          child: _postDetailForm(screenSize),
        ),
      ),
    );
  }

  Widget _postDetailForm(Size size){
    final ScrollController scrollController = ScrollController();

    return BlocListener<EditPostFormBloc,EditPostFormState>(
      listener: (context, state){
        state.editFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (f) => showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                        backgroundColor: FeelinColorFamily.errorPrimary,
                        icon: const Icon(Icons.music_note, color: Colors.transparent,),
                        message: f.toString())
                ),
                (_) => {
              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(widget.playlist.tracks[0].id.toString()))),
              Navigator.pop(context, true),
            },
          ),

        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: CachedNetworkImageProvider(widget.post.playlist.thumbnail!),
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
                    context.read<EditPostFormBloc>().state.title.value.fold(
                          (f) => f.maybeMap(
                        orElse: () => null,
                      ),
                          (_) => null,
                    ),
                onChanged: (value) => context
                    .read<EditPostFormBloc>()
                    .add(EditPostFormEvent.titleChanged(value)),
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
                    context.read<EditPostFormBloc>().state.content.value.fold(
                          (f) => f.maybeMap(
                        orElse: () => null,
                      ),
                          (_) => null,
                    ),
                onChanged: (value) => context
                    .read<EditPostFormBloc>()
                    .add(EditPostFormEvent.contentChanged(value)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemText(context, int index) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 35,
      width: MediaQuery.of(context).size.width - 140,
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(widget.post.playlist.tracks![index].title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Marquee(
              direction: Axis.horizontal,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.post.playlist.tracks![index].artists.length,
                itemBuilder: (context, index2){
                  return Text(
                    widget.post.playlist.tracks![index].artists[index2].name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color(0xff7077D5),
                        fontSize: 12
                    ),
                  );
                },
                separatorBuilder: (context, index2) => const Text(
                  ", ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff7077D5),
                      fontSize: 12
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}