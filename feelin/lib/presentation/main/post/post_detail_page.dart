import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/navigation/nav_bar_item.dart';
import 'package:music_sns/application/navigation/navigation_cubit.dart';
import 'package:music_sns/application/post/post_detail_form/post_detail_form_bloc.dart';
import 'package:music_sns/injection.dart';
import 'package:music_sns/presentation/main/root_page.dart';

import '../../../domain/custom/marquee.dart';
import '../../../domain/play/playlist.dart';
import '../../../domain/play/track.dart';

class PostDetailPage extends StatefulWidget{
  const PostDetailPage({Key? key, required this.playlist}) : super(key: key);
  final Playlist playlist;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();


  @override
  void initState(){
    super.initState();
    context.read<PostDetailFormBloc>().add(PostDetailFormEvent.titleChanged(widget.playlist.title));
    context.read<PostDetailFormBloc>().add(PostDetailFormEvent.playlistPreviewChanged(widget.playlist.playlistPreview));
    _titleTextController.text = widget.playlist.title;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;
    //_titleTextController.text = context.read<PostDetailFormBloc>().state.title.value.fold((f) => widget.playlist.title, (title) => title);

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
              //TODO: implement the post button.
              context.read<PostDetailFormBloc>().add(const PostDetailFormEvent.submitted());
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO: implement the post button.
            context.read<PostDetailFormBloc>().add(const PostDetailFormEvent.submitted());
          },
          backgroundColor: const Color(0xff7077D5),
          foregroundColor: Colors.white,
          //label: const Text('작성'),
          child: const Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 12,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.folder_copy_outlined),
                label: ''
            ),
            BottomNavigationBarItem(icon: Icon(Icons.add, color: Colors.transparent,),label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: ''
            ),
          ],
        ),
      ),
    );
  }

  Widget _postDetailForm(Size size){
    final ScrollController scrollController = ScrollController();

    return BlocListener<PostDetailFormBloc,PostDetailFormState>(
      listener: (context, state){
        state.postFailureOrSuccessOption.fold(
              () => null,
              (failureOrSuccess) => failureOrSuccess.fold(
                (f) => _showSnackBar(context, f.toString()),
                (_) => {
                //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(widget.playlist.tracks[0].id.toString()))),
              Navigator.push(context,
                MaterialPageRoute(
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
                    image: NetworkImage(widget.playlist.tracks[0].album.thumbnail),
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
                          context.read<PostDetailFormBloc>().state.title.value.fold(
                                (f) => f.maybeMap(
                              orElse: () => null,
                            ),
                                (_) => null,
                          ),
                      onChanged: (value) => context
                          .read<PostDetailFormBloc>()
                          .add(PostDetailFormEvent.titleChanged(value)),
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
                    context.read<PostDetailFormBloc>().state.content.value.fold(
                          (f) => f.maybeMap(
                        orElse: () => null,
                      ),
                          (_) => null,
                    ),
                onChanged: (value) => context
                    .read<PostDetailFormBloc>()
                    .add(PostDetailFormEvent.contentChanged(value)),
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
                          final Track item = widget.playlist.tracks.removeAt(oldIndex);
                          widget.playlist.tracks.insert(newIndex, item);
                          }
                        );
                      },
                      itemCount: widget.playlist.tracks.length,
                      itemBuilder: (context, index) {
                        return Container(
                          key: ValueKey(index),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Image(
                                image: NetworkImage(
                                    widget.playlist.tracks[index].album.thumbnail),
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
            child: Text(widget.playlist.tracks[index].title,
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
                itemCount: widget.playlist.tracks[index].artists.length,
                itemBuilder: (context, index2){
                  return Text(
                    widget.playlist.tracks[index].artists[index2].name,
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