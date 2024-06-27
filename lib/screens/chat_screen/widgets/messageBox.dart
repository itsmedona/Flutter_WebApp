import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/core/colors/app_colors.dart';
import 'package:flutter_web_dashboard/widgets/master_layout/master_layout_config.dart';

class MessageBox extends StatefulWidget {
  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    userprofile.shuffle();
    var profile = userprofile[0];
    var myprofile = userprofile[2];
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Text(
                "Scouting Group",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Wellcome to Stream line scouting chat",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "We can now freely collaborate regarding our current demand\n"
                "Any question about the documentaion or the project\n"
                "please feel free to get in contact us\n",
                style: TextStyle(
                    color: Color(0xff78A1C6),
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Tuesdy, April 7th at 1:21PM",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: myprofile,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMessage("Awesome! it's going to be amzing deal!"),
                      _buildMessage("I've run through different docs"),
                      _buildMessage("Hope for the best"),
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildMessage(
                        "Thanks for the sending the deal, I'll review it",
                        isSend: true,
                      ),
                      _buildMessage(
                        "and getback to you shortly",
                        isSend: true,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: profile,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(icon: const Icon(Icons.attach_file), onPressed: () {}),
              Expanded(
                child: TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: "Write message..",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.send_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  messageController.clear();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildMessage(String message, {bool isSend = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color:
            isSend ? AppColors.primaryColor : Colors.grey[300]?.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Text(
        message,
        style: TextStyle(color: isSend ? Colors.white : null),
      ),
    );
  }
}

class MessageBoxMobileview extends StatefulWidget {
  @override
  State<MessageBoxMobileview> createState() => _MessageBoxMobileviewState();
}

class _MessageBoxMobileviewState extends State<MessageBoxMobileview> {
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    userprofile.shuffle();
    var profile = userprofile[0];
    var myprofile = userprofile[2];
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Text(
                "Scouting Group",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Wellcome to Stream line scouting chat",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "We can now freely collaborate regarding our current demand\n"
                "Any question about the documentaion or the project\n"
                "please feel free to get in contact us\n",
                style: TextStyle(
                    color: Color(0xff78A1C6),
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Tuesdy, April 7th at 1:21PM",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: myprofile,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMessageMobile("Awesome! "),
                      _buildMessageMobile("I've run through "),
                      _buildMessageMobile("Hope for the best"),
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildMessageMobile(
                        "Thanks ",
                        isSend: true,
                      ),
                      _buildMessageMobile(
                        "and getback to you shortly",
                        isSend: true,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: profile,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(icon: const Icon(Icons.attach_file), onPressed: () {}),
              Expanded(
                child: TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: "Write message..",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.send_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  messageController.clear();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildMessageMobile(String message, {bool isSend = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color:
            isSend ? AppColors.primaryColor : Colors.grey[300]?.withOpacity(.4),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Text(
        message,
        style: TextStyle(color: isSend ? Colors.white : null),
      ),
    );
  }
}
