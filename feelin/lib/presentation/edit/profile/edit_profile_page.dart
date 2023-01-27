import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/domain/post/max_lines_input_formatters.dart';
import 'package:music_sns/domain/profile/profile.dart';
import 'package:music_sns/presentation/style/colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../application/edit/edit_profile_form/edit_profile_form_bloc.dart';
import 'edt_profile_app_bar.dart';

class EditProfilePage extends StatefulWidget{
  const EditProfilePage({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _introductionTextController = TextEditingController();

  @override
  void initState(){
    super.initState();
    context.read<EditProfileFormBloc>().add(EditProfileFormEvent.nameChanged(widget.profile.name!));
    context.read<EditProfileFormBloc>().add(EditProfileFormEvent.usernameChanged(widget.profile.username));
    context.read<EditProfileFormBloc>().add(EditProfileFormEvent.introductionChanged(widget.profile.introduction ?? ''));
    _nameTextController.text = widget.profile.name!;
    _usernameTextController.text = widget.profile.username;
    _introductionTextController.text = widget.profile.introduction ?? '';
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    Size screenSize = deviceData.size;

    return Scaffold(
      appBar: EditProfileAppBar(profile: widget.profile),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _editProfileForm(screenSize),
      ),
    );
  }

  Widget _editProfileForm(Size size){
    return BlocListener<EditProfileFormBloc, EditProfileFormState>(
        listener: (context, state){
          state.editFailureOrSuccessOption.fold(
                  () => null,
                  (failureOrSuccess) => failureOrSuccess.fold(
                          (f) => showTopSnackBar(
                            Overlay.of(context),
                              CustomSnackBar.error(message: f.toString())
                          ),
                          (profile) => {
                            Navigator.pop(context, true),
                          })
          );
        },
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _profileImage(),
              const SizedBox(height: 50,),
              _nameField(),
              const SizedBox(height: 10,),
              _usernameField(),
              const SizedBox(height: 10,),
              _introductionField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImage(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(75),
      child: Image(
          image: widget.profile.profileImage == null ? const AssetImage('assets/images/user_default.png') as ImageProvider : CachedNetworkImageProvider(widget.profile.profileImage!),
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _nameField() {
    return BlocBuilder<EditProfileFormBloc, EditProfileFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _nameTextController,
            textAlign: TextAlign.center,
            maxLength: 30,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            decoration: const InputDecoration(
              hintText: 'Name',
              labelText: 'Name',
              counterText: '',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
              isDense: true,
            ),
            onChanged: (value) {
              context.read<EditProfileFormBloc>().add(EditProfileFormEvent.nameChanged(value));
              context.read<EditProfileFormBloc>().add(const EditProfileFormEvent.resetCanUseName());
            }
            ,
          );
        });
  }

  Widget _usernameField() {
    return BlocBuilder<EditProfileFormBloc, EditProfileFormState>(
        builder: (context, state) {
          return TextFormField(
            controller: _usernameTextController,
            textAlign: TextAlign.center,
            maxLength: 20,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Username',
              labelText: 'Username',
              counterText: '',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
              isDense: true,
              suffixIcon: ((state.username.isValid() && state.username.getOrCrash() == widget.profile.username) ||
                  state.canUseName) ? const Icon(Icons.check_circle_outline, color: Colors.green,) : Icon(Icons.cancel_outlined, color: FeelinColorFamily.redPrimary,),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-z A-Z 0-9 . _]')),
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            //validator: (_) =>
            //((state.username.isValid() && state.username.getOrCrash() == widget.profile.username) || state.canUseName) ? null : 'A user with that username already exists.',
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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              letterSpacing: -0.41,
            ),
            keyboardType: TextInputType.multiline,
            controller: _introductionTextController,
            inputFormatters: [
              MaxLinesInputFormatters(2),
            ],
            decoration: InputDecoration(
              hintText: 'Add a bio',
              isDense: true,
              labelText: 'Bio',
              counterText: '',
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: FeelinColorFamily.gray500,
                letterSpacing: -0.41,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
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