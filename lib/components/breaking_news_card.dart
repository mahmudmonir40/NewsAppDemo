import 'package:flutter/material.dart';
import 'package:news_app/model/new_model.dart';
import 'package:news_app/screens/details_screen.dart';

class BreakingNewsCard extends StatefulWidget {
  BreakingNewsCard(this.data, {Key? key}) : super(key: key);
  NewsData data;
  @override
  State<BreakingNewsCard> createState() => _BreakingNewsCardState();
}

class _BreakingNewsCardState extends State<BreakingNewsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(widget.data)));
      },


      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
              image: NetworkImage(widget.data.urlToImage!), fit: BoxFit.fill),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.title!,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                widget.data.author!,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white54,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
