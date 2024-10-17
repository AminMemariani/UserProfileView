import 'package:flutter/material.dart';

import '../app_data/app_data.dart';
import '../models/profile.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  Profile? profile;

  @override
  void initState() {
    profile = AppData.profiles[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 20),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 750),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: const Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            ),
            child: HeaderSection(
              profile: profile,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            children: [
              for (int i = 0; i < AppData.profiles.length; i++)
                GestureDetector(
                  onTap: () {
                    profile = AppData.profiles[i];
                    setState(() {});
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(AppData.profiles[i].imageUrl ?? ""),
                            fit: BoxFit.cover)),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final Profile? profile;
  HeaderSection({
    Key? key,
    this.profile,
  }) : super(key: ValueKey<String>(profile?.imageUrl ?? ""));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
                image: AssetImage(profile?.imageUrl ?? ""), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          child: Text(
            profile?.title ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Text(
            profile?.subtitle ?? "",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.link),
              Text(
                profile?.webLink ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 0,
                  blurRadius: 30,
                  offset: const Offset(0, 4),
                )
              ]),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    profile?.totalPost ?? "",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Text('Post')
                ],
              ),
              Column(
                children: [
                  Text(
                    profile?.totalFollowers ?? "",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Text('Followers')
                ],
              ),
              Column(
                children: [
                  Text(
                    profile?.totalFollowing ?? "",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Text('Following')
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
