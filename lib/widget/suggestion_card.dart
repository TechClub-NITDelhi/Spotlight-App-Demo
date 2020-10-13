import 'package:flutter/material.dart';
import 'package:inshorts_clone/constant.dart';
import 'package:inshorts_clone/screens/selected_topic_screen.dart';

class SuggestionCard extends StatelessWidget {
  // final String icon;
  final String title;


  SuggestionCard({ this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SelectedTopicScreen(
            topic: title,
          )
        ));

      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: size.height*0.2,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).accentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icons/$title.png",
                fit: BoxFit.contain,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  title,
                  style:
                    kTopicTitleTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
