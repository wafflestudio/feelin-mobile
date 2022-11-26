import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/profile/profile_bloc.dart';
import 'package:music_sns/presentation/main/explore/explore_page.dart';
import 'package:music_sns/presentation/main/post/post_page.dart';
import 'package:music_sns/presentation/main/profile/profile_page.dart';

import '../../application/navigation/nav_bar_item.dart';
import '../../application/navigation/navigation_cubit.dart';
import '../../application/post/post_form/post_form_bloc.dart';
import '../../injection.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            showUnselectedLabels: false,
            showSelectedLabels: false,
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
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.explore);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.post);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.profile);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (state.navbarItem == NavbarItem.explore) {
              return const ExplorePage();
            } else if (state.navbarItem == NavbarItem.post) {
              return BlocProvider(create: (context) => getIt<PostFormBloc>(),
                  child: const PostPage());
            } else if (state.navbarItem == NavbarItem.profile) {
              return BlocProvider(create: (context) => getIt<ProfileBloc>(),
                  child: const ProfilePage());
            }
            return Container();
          }),
    );
  }
}