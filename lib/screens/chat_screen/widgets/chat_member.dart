import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/screens/chat_screen/widgets/member_card.dart';

class ChatMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Chats",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              Spacer(),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              SizedBox(width: 20),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.blue.withOpacity(.1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("Open", style: TextStyle(color: Colors.blue)),
              ),
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.blue.withOpacity(.1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  // border: Border.all(
                  //     color: Theme.of(context).iconTheme.color, width: .5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Open",
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Column(
            children: List.generate(
              members.length,
              (index) => MemberCard(member: members[index]),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Icon(Icons.feedback),
              SizedBox(width: 10),
              Text(
                "Submit Feedback",
                style: TextStyle(color: Theme.of(context).iconTheme.color),
              )
            ],
          )
        ],
      ),
    );
  }
}
