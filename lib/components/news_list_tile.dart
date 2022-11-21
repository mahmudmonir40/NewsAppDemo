
import 'package:flutter/material.dart';
import 'package:news_app/model/new_model.dart';
import 'package:news_app/screens/details_screen.dart';

class NewsListTile extends StatefulWidget {
  NewsListTile(this.data, {Key? key}) : super(key: key);
  NewsData data;

  @override
  State<NewsListTile> createState() => _NewsListTileState();
}

class _NewsListTileState extends State<NewsListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(widget.data)));
      },

      child: Hero(
        tag: "${widget.data.title}",
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 20.0),
          padding: EdgeInsets.all(12.0),
          height: 130,

          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(26.0),
          ),

          child: Column(
            children: [
              Flexible(
                flex: 3,
                  child: Container(
                height: 100.0,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),

                  image: DecorationImage(
                      image: NetworkImage(widget.data.urlToImage!),fit: BoxFit.fitHeight,
                  )
                ),
              ),
              ),

              SizedBox(
                height: 10.0,
              ),

              Flexible(
                flex: 5,
                  child: Column(
                    children: [
                      Text(widget.data.title!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                      SizedBox(height: 5.0,),
                      Text(widget.data.content!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white54),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
