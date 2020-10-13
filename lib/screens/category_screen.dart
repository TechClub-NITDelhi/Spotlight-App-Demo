import 'package:flutter/material.dart';
import 'package:inshorts_clone/constant.dart';
import 'package:inshorts_clone/widget/suggestion_card.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text('Suggested Topics'.toUpperCase(), style: kHeadlineTextStyle,),
                  SizedBox(height: 8,),
                  Container(width: 36,
                  height: 2.5,
                  color: Color(0xff8192A3),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: 1/1.4,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: [
                  SuggestionCard(
                    title: 'coronavirus',
                  ),
                  SuggestionCard(
                    title: 'sports',
                  ),
                  SuggestionCard(
                    title: 'politics',
                  ),SuggestionCard(
                    title: 'entertainment',
                  ),SuggestionCard(
                    title: 'business',
                  ),SuggestionCard(
                    title: 'india',
                  ),SuggestionCard(
                    title: 'technology',
                  ),SuggestionCard(
                    title: 'startups',
                  ),
                  SuggestionCard(
                    title: 'education',
                  ),
                  SuggestionCard(
                    title: 'automobile',
                  ),
                  SuggestionCard(
                    title: 'travel',
                  ),
                  SuggestionCard(
                    title: 'fashion',
                  ),

                ],
              ),
            )
          ],
        ),
      ),
      );
  }
}









//-----------------naming convention-------------------
//category_screen --> file name
//categoryScreen --> (camelcase) function name, variable name
//CategoryScreen --> class name