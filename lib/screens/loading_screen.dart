import 'package:flutter/material.dart';
import 'package:inshorts_clone/constant.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: double.maxFinite,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0.3),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/loading.png',
                  fit: BoxFit.contain,
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height *0.5,),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Loading news',
                    style: kLoadingTextStyle,
                  )
                ]
              ),
            ),

          ),
        )
      ),
    );
  }
}
