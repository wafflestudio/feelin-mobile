import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/domain/profile/profile.dart';

import '../../../application/edit/edit_profile_form/edit_profile_form_bloc.dart';
import '../../../application/navigation/nav_bar_item.dart';
import '../../../application/navigation/navigation_cubit.dart';
import '../../main/root_page.dart';

class EditProfilePage extends StatefulWidget{
  const EditProfilePage({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _introductionTextController = TextEditingController();

  @override
  void initState(){
    super.initState();
    context.read<EditProfileFormBloc>().add(EditProfileFormEvent.usernameChanged(widget.profile.username));
    context.read<EditProfileFormBloc>().add(EditProfileFormEvent.introductionChanged(widget.profile.introduction ?? ''));
    _usernameTextController.text = widget.profile.username;
    _introductionTextController.text = widget.profile.introduction ?? '';
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;
    final state = context.read<EditProfileFormBloc>().state;

    return Scaffold(
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
            onPressed: ((state.username.isValid() && state.username.getOrCrash() == widget.profile.username) ||
                state.canUseName) ? () {
              context.read<EditProfileFormBloc>().add(const EditProfileFormEvent.submitted());
            } : null,
            color: const Color(0xff7077D5),
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _editProfileForm(screenSize),
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

  Widget _editProfileForm(Size size){
    return BlocListener<EditProfileFormBloc, EditProfileFormState>(
        listener: (context, state){
          state.editFailureOrSuccessOption.fold(
                  () => null,
                  (failureOrSuccess) => failureOrSuccess.fold(
                          (f) => null,
                          (profile) => {
                            Navigator.pushReplacement(context,
                              CupertinoPageRoute(
                                builder: (context){
                                  BlocProvider.of<NavigationCubit>(context)
                                      .getNavBarItem(NavbarItem.profile);
                                  return const RootPage();
                                },
                              ),
                            ),
                          })
          );
        },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _profileImage(),
            _usernameField(),
            _introductionField(),
          ],
        ),
      ),
    );
  }

  Widget _profileImage(){
    return const Image(
      image: CachedNetworkImageProvider('https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG'),
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    );
  }
  Widget _usernameField() {
    return BlocBuilder<EditProfileFormBloc, EditProfileFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _usernameTextController,
            decoration: InputDecoration(
              hintText: '사용자 이름',
              isDense: true,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
              suffixIcon: ((state.username.isValid() && state.username.getOrCrash() == widget.profile.username) ||
                  state.canUseName) ? const Icon(Icons.check_circle, color: Colors.green,) : const Icon(Icons.cancel, color: Colors.red,),
            ),
            validator: (_) =>
                context.read<EditProfileFormBloc>().state.username.value.fold(
                      (f) => f.maybeMap(
                    invalidUserName: (_) => '사용자 이름을 입력해주세요',
                    orElse: () => null,
                  ),
                      (_) => null,
                ),
            onChanged: (value) {
              context.read<EditProfileFormBloc>().add(EditProfileFormEvent.usernameChanged(value));
              context.read<EditProfileFormBloc>().add(const EditProfileFormEvent.resetCanUseName());
            }
            ,
          );
        });
  }

  Widget _introductionField(){
    return BlocBuilder<EditProfileFormBloc, EditProfileFormState>(
        builder: (context, state){
          return TextFormField(
            maxLength: 100,
            minLines: 1,
            maxLines: 3,
            expands: false,
            keyboardType: TextInputType.multiline,
            controller: _introductionTextController,
            decoration: const InputDecoration(
              hintText: '소개 문구 입력..',
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7DD8C6),
                ),
              ),
            ),
            onChanged: (value) => context
                .read<EditProfileFormBloc>()
                .add(EditProfileFormEvent.introductionChanged(value)),
          );
        }
    );
  }
}