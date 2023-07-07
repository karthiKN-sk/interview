import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/src/models/userlist_model.dart';
import 'package:interview/src/view/userdetailpage.dart';
import 'package:interview/widget/herotag.dart';

import '../../theme/theme.dart';
import '../../widget/fade_ani.dart';
import '../businesslogic/userList/user_get_data_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late UserGetDataBloc userGetDataBloc;
  int page = 1;
  late ThemeData themeData;
  @override
  void initState() {
    super.initState();
    userGetDataBloc = BlocProvider.of<UserGetDataBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => userGetDataBloc..add(LoadUserEvent(page)),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themeData.colorScheme.onSecondary,
          title: Text(
            "User List",
            style: AppTheme.getTextStyle(
              fontSize: 18,
              fontWeight: 800,
              color: themeData.colorScheme.primary,
            ),
          ),
        ),
        body: BlocBuilder<UserGetDataBloc, UserGetDataState>(
          builder: (context, state) {
            if (state is UserGetDataInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserGetErrorState) {
              return Center(
                  child: Text(
                "Error",
                style: AppTheme.getTextStyle(
                  fontSize: 18,
                ),
              ));
            }
            if (state is UserGetLoadedState) {
              List<Data> userList = state.users.data!;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  userList.isNotEmpty
                      ? FadeAnimation(
                          0.7,
                          child: ListView.builder(
                            itemCount: userList.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              Data model = userList[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserDetailPage(userID: model.id!),
                                      ));
                                },
                                child: Container(
                                  width: AppTheme.screenWidth,
                                  padding: const EdgeInsets.all(6),
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: themeData.colorScheme.background,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(-1,
                                            0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          HeroWidget(
                                            tag: HeroTag.image(
                                                model.avatar!.toString()),
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage(
                                                  model.avatar.toString()),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              HeroWidget(
                                                tag: HeroTag.image(
                                                    "${model.firstName!} ${model.lastName!}"),
                                                child: Text(
                                                  "${model.firstName!} ${model.lastName!}",
                                                  style: AppTheme.getTextStyle(
                                                    fontSize: 20,
                                                    fontWeight: 800,
                                                    color: themeData.colorScheme
                                                        .inversePrimary,
                                                  ),
                                                ),
                                              ),
                                              HeroWidget(
                                                tag: HeroTag.image(
                                                    model.email!.toString()),
                                                child: Text(
                                                  model.email!,
                                                  style: AppTheme.getTextStyle(
                                                    fontSize: 16,
                                                    fontWeight: 600,
                                                    color: themeData
                                                        .colorScheme.secondary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              "No Data Availabile",
                              style: AppTheme.getTextStyle(
                                fontSize: 16,
                                fontWeight: 600,
                                color: themeData.colorScheme.secondary,
                              ),
                            ),
                          ),
                        ),
                  FadeAnimation(
                    0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        state.users.page! != 1
                            ? IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  setState(() {
                                    page--;
                                  });
                                  BlocProvider.of<UserGetDataBloc>(context)
                                      .add(LoadUserEvent(page));
                                },
                              )
                            : Container(),
                        Text(
                          state.users.page!.toString(),
                          style: AppTheme.getTextStyle(
                            fontSize: 16,
                            fontWeight: 600,
                            color: themeData.colorScheme.secondary,
                          ),
                        ),
                        userList.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                onPressed: () {
                                  setState(() {
                                    page++;
                                  });
                                  BlocProvider.of<UserGetDataBloc>(context)
                                      .add(LoadUserEvent(page));
                                },
                              )
                            : Container(),
                      ],
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
