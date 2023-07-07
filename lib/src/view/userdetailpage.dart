import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme.dart';
import '../../widget/fade_ani.dart';
import '../../widget/herotag.dart';
import '../businesslogic/user_detail/user_detail_bloc.dart';
import '../models/userlist_model.dart';

class UserDetailPage extends StatefulWidget {
  final int userID;
  const UserDetailPage({super.key, required this.userID});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late ThemeData themeData;
  late UserDetailBloc userDetailBloc;
  @override
  void initState() {
    super.initState();
    userDetailBloc = BlocProvider.of<UserDetailBloc>(context)
      ..add(LoadUserDetailEvent(widget.userID));
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: themeData.colorScheme.onSecondary,
        title: Text(
          "User Detail",
          style: AppTheme.getTextStyle(
            fontSize: 18,
            fontWeight: 800,
            color: themeData.colorScheme.primary,
          ),
        ),
      ),
      body: BlocConsumer<UserDetailBloc, UserDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UserDetailInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserDetailErrorState) {
            return Center(
                child: Text(
              "Error",
              style: AppTheme.getTextStyle(
                fontSize: 18,
              ),
            ));
          }
          if (state is UserDetailLoadedState) {
            Data userdetail = state.users.data!;

            return FadeAnimation(
              0.6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    HeroWidget(
                      tag: HeroTag.image(userdetail.avatar!.toString()),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            NetworkImage(userdetail.avatar!.toString()),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HeroWidget(
                          tag: HeroTag.image(
                              "${userdetail.firstName!} ${userdetail.lastName!}"),
                          child: Text(
                            "${userdetail.firstName!} ${userdetail.lastName!}",
                            style: AppTheme.getTextStyle(
                              fontSize: 30,
                              fontWeight: 800,
                              color: themeData.colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                        HeroWidget(
                          tag: HeroTag.image(userdetail.email!.toString()),
                          child: Text(
                            userdetail.email!,
                            style: AppTheme.getTextStyle(
                              fontSize: 20,
                              fontWeight: 600,
                              color: themeData.colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
