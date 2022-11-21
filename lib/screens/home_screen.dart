//let's start by our home screen

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/breaking_news_card.dart';
import 'package:news_app/components/news_list_tile.dart';
import 'package:news_app/model/new_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //let's start with the appbar

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "NewsApp",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),

      //let's now work on the body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Breaking News",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 20.0,
              ),

              //let's build our carousel
              CarouselSlider.builder(
                itemCount: NewsData.breakingNewsData.length,
                itemBuilder: (context, index, id) => BreakingNewsCard(
                  NewsData.breakingNewsData[index],
                ),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                ),
              ),

              SizedBox(
                height: 40.0,
              ),
              Text(
                "Recent News",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),


              SizedBox(height: 16.0,),
              //Now let's create the cards for the recent news
              Column(
                children: NewsData.recentNewsData.map((e) => NewsListTile(e)).toList(),
              ),
            ],
          ),
        ),
      ),

      //now let's create the button navigation bar
      bottomNavigationBar: Container(
        //let's make our button nav bar float

        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0), color: Colors.black),

        child: BottomNavigationBar(
            elevation: 0.0,
            selectedItemColor: Colors.orange.shade900,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Icon(Icons.home),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: "Bookmark"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.feed_rounded), label: "Feed"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ]),
      ),
    );
  }
}
