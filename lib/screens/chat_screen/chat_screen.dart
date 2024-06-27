import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/animations/entrance_fader.dart';
import 'package:flutter_web_dashboard/core/constants/dimens.dart';
import 'package:flutter_web_dashboard/screens/chat_screen/widgets/chat_member.dart';
import 'package:flutter_web_dashboard/screens/chat_screen/widgets/member_card.dart';
import 'package:flutter_web_dashboard/screens/chat_screen/widgets/messageBox.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout.dart';
import 'package:flutter_web_dashboard/widgets/sized_box.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return PortalMasterLayout(
      body: EntranceFader(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: ListView(
            children: [
              Wrap(
                runSpacing: kDefaultPadding,
                children: [
                  mediaQueryData.size.width <= kScreenWidthMd
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 800, child: ChatMember()),
                            SizedBox(height: 750, child: MoreDetails())
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child:
                                    SizedBox(height: 800, child: ChatMember())),
                            buildSizedboxW(kDefaultPadding),
                            Expanded(
                                child:
                                    SizedBox(height: 750, child: MoreDetails()))
                          ],
                        ),
                  mediaQueryData.size.width <= kScreenWidthMd
                      ? SizedBox(
                          width: double.infinity,
                          height: 800,
                          child: MessageBoxMobileview())
                      : SizedBox(
                          width: kScreenWidthXxl * 2,
                          height: 800,
                          child: MessageBox()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey[700],
            indicatorColor: Theme.of(context).primaryColor,
            tabs: const [
              Tab(text: "Chat Members"),
              Tab(text: "Shared Files"),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Members".toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  children: List.generate(
                    3,
                    (index) => MemberCard(
                      showJob: true,
                      member: members[index],
                      trailing: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor.withOpacity(.1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            color: Theme.of(context).primaryColor,
                            icon: const Icon(Icons.message),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(),
                buildSizedBoxH(kDefaultPadding + kTextPadding),
                Row(
                  children: [
                    Text(
                      "Admins".toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: List.generate(
                    1,
                    (index) => MemberCard(
                      showJob: true,
                      member: members[index],
                      trailing: Container(
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor.withOpacity(.1),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              color: Theme.of(context).primaryColor,
                              icon: const Icon(Icons.message),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  title: const Text(
                    "Customize Chat",
                    style: TextStyle(
                      color: Color(0xff78A1C6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Change Layout and Colors",
                    style: TextStyle(
                      color: const Color(0xff78A1C6).withOpacity(.7),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Privacy and Support",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text("Get immediate support"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
