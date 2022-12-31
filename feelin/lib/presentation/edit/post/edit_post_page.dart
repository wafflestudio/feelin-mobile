import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/edit/edit_post_form/edit_post_form_bloc.dart';
import '../../../application/navigation/nav_bar_item.dart';
import '../../../application/navigation/navigation_cubit.dart';
import '../../../domain/custom/marquee.dart';
import '../../../domain/play/post.dart';
import '../../../domain/play/track.dart';
import '../../main/root_page.dart';

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
    context.read<EditPostFormBloc>().add(EditPostFormEvent.titleChanged(widget.post.title));
    context.read<EditPostFormBloc>().add(EditPostFormEvent.contentChanged(widget.post.content));
    _titleTextController.text = widget.post.title;
    _contentTextController.text = widget.post.content;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return Scaffold(
      extendBody: true,
      key: widget.key,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(''),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.grey,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<EditPostFormBloc>().add(const EditPostFormEvent.submitted());
            },
            color: const Color(0xff7077D5),
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        maintainBottomViewPadding: true,
        child: Container(
          child: _postDetailForm(screenSize),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.folder_copy_outlined),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ''
          ),
        ],
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
                (f) => _showSnackBar(context, f.toString()),
                (_) => {
              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(widget.playlist.tracks[0].id.toString()))),
              Navigator.push(context,
                CupertinoPageRoute(
                  builder: (context){
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavbarItem.profile);
                    return const RootPage();
                  },
                ),
              ),
            },
          ),

        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 130,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: CachedNetworkImageProvider(widget.post.playlist.tracks![0].album.thumbnail),
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                    child: TextFormField(
                      maxLength: 25,
                      controller: _titleTextController,
                      decoration: const InputDecoration(
                        labelText: '제목',
                        hintText: '제목 입력..',
                        isDense: true,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff7DD8C6),
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
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 100,
              child: TextFormField(
                maxLength: 100,
                minLines: 1,
                maxLines: 3,
                expands: false,
                keyboardType: TextInputType.multiline,
                controller: _contentTextController,
                decoration: const InputDecoration(
                  hintText: '문구 입력..',
                  isDense: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff7DD8C6),
                    ),
                  ),
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
            Container(
              width: double.infinity,
              height: 1.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 1.0),
                      colors: <Color>[
                        Color(0xff00C19C),
                        Color(0xff7077D5),
                      ],
                      stops: <double>[0.0, 1.0],
                      tileMode: TileMode.clamp
                  )
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: ReorderableListView.builder(
                      footer: const SizedBox(height: 50,),
                      physics: const BouncingScrollPhysics(),
                      scrollController: scrollController,
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          if (oldIndex < newIndex) {
                            newIndex -= 1;
                          }
                          final Track item = widget.post.playlist.tracks!.removeAt(oldIndex);
                          widget.post.playlist.tracks!.insert(newIndex, item);
                        }
                        );
                      },
                      itemCount: widget.post.playlist.tracks!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          key: ValueKey(index),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Image(
                                image: CachedNetworkImageProvider(
                                    widget.post.playlist.tracks![index].album.thumbnail),
                                fit: BoxFit.cover,
                                width: 45,
                                height: 45,),
                              _itemText(context, index),
                              ReorderableDragStartListener(
                                index: index,
                                child: const SizedBox(
                                    height: 45,
                                    width: 45,
                                    child: Icon(Icons.drag_handle)),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
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

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}