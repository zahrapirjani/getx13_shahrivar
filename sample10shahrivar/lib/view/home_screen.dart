import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/data_models.dart';
import '../models/faka_data.dart';
import '../models/my_strings.dart';
import '../models/mycolors.dart';
import 'myComponents.dart';

class homeScreen extends StatelessWidget {
   homeScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  var size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          homePagePoster(size: size),
          SizedBox(height: 16,),
          homePageTags(bodyMargin: bodyMargin),
          SizedBox(height: 32,),
          seeMoreBlog(bodyMargin: bodyMargin),
          homePageBlogList(size: size, bodyMargin: bodyMargin),
          SizedBox(height: 16,),
          seeMorePodcast(bodyMargin: bodyMargin),
          homePagePodcastList(size: size, bodyMargin: bodyMargin)

        ],
      ),
    );
  }
}

class homePagePodcastList extends StatelessWidget {
   homePagePodcastList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

 var size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:size.height/2.5,
      child: ListView.builder( scrollDirection:Axis.horizontal,itemCount:podcatList.length,itemBuilder: (context,index){
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: index ==0?bodyMargin:15),
              child: SizedBox(
                width:size.width/1.9  ,
                height: size.height/4,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              image: NetworkImage(podcatList[index].poster),
                              fit: BoxFit.cover
                          )
                      ),foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                            colors: gradiantcolors.blogPost,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter
                        )
                    ),
                    )],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12,index==0?bodyMargin:15 , 8),
              child: SizedBox(
                  width:size.width/1.9 ,
                  child: Text(podcatList[index].title,
                    style: TextStyle(fontFamily: "bnazanin",fontSize: 17,fontWeight: FontWeight.bold),

                  )),
            )
          ],

        );
      }),
    );
  }
}

class seeMorePodcast extends StatelessWidget {
  const seeMorePodcast({
    super.key,
    required this.bodyMargin,
  });

  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right:bodyMargin,bottom: 8 ),
      child: const Row(
        children: [
          Icon(Icons.podcasts,size: 17,color: solidcolors.seeMore,),
          SizedBox(width: 12,),
          Text(mystrings.viewHotestPodcasts,style: TextStyle(color: solidcolors.seeMore,fontWeight: FontWeight.bold,fontSize: 18,fontFamily: "bnazanin"),),

        ],
      ),
    );
  }
}

class homePageBlogList extends StatelessWidget {
   homePageBlogList({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

   var size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:size.height/3 ,
      child: ListView.builder(itemCount: blogList.length,scrollDirection:Axis.horizontal,itemBuilder: (context,index){
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: index==0?bodyMargin:15),
              child: SizedBox(
                width:size.width/1.9  ,
                height: size.height/4,
                child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: NetworkImage(blogList[index].imageUrl),
                                fit: BoxFit.cover
                            )
                        ),foregroundDecoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: LinearGradient(colors:gradiantcolors.blogPost,
                              begin: Alignment.bottomCenter ,
                              end: Alignment.topCenter
                          )
                      ) ,
                      ),
                      Positioned(
                        bottom: 12,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(blogList[index].writer,style: TextStyle(color: Color.fromARGB(168, 255, 255, 255),fontWeight: FontWeight.w300,fontSize: 16,fontFamily: "bnazanin")),
                            Row(
                              children: [
                                Text(blogList[index].views,style: TextStyle(color: Color.fromARGB(168, 255, 255, 255),fontWeight: FontWeight.w300,fontSize: 16,fontFamily: "bnazanin")),
                                SizedBox(width: 10,),
                                Icon(Icons.remove_red_eye_outlined,color: Color.fromARGB(152, 255, 255, 255),),
                              ],
                            ),

                          ],
                        ),
                      )
                    ]
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12,index==0?bodyMargin:15 , 8),
              child: SizedBox(
                  width:size.width/1.9 ,
                  child: Text(blogList[index].title,
                    style: TextStyle(fontFamily: "bnazanin",fontSize: 17,fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2 ,
                    selectionColor: solidcolors.primaryColor,
                  )),
            )
          ],
        );
      }),
    );
  }
}

class seeMoreBlog extends StatelessWidget {
  const seeMoreBlog({
    super.key,
    required this.bodyMargin,
  });

  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right:bodyMargin,bottom: 8 ),
      child: const Row(
        children: [
          ImageIcon(AssetImage("assets/icons/blue_pen.png"),size: 17,color: solidcolors.seeMore,),
          SizedBox(width: 12,),
          Text(mystrings.viewHotestBlog,style: TextStyle(color: solidcolors.seeMore,fontWeight: FontWeight.bold,fontSize: 18,fontFamily: "bnazanin"),),

        ],
      ),
    );
  }
}

class homePageTags extends StatelessWidget {
  const homePageTags({
    super.key,
    required this.bodyMargin,
  });

  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(scrollDirection:Axis.horizontal,itemCount:tagList.length ,itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.fromLTRB(0, 8,index==0?bodyMargin:15 , 8),
          child: HashTags(index: index,),
        );
      }),
    );
  }
}

class homePagePoster extends StatelessWidget {
  var size;
   homePagePoster({
    super.key,
    required this.size,
  });



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width/1.17,
          height: size.height/4.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                  image:AssetImage("assets/images/poster_test.png"),
                  fit: BoxFit.cover
              )
          ),
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  colors: gradiantcolors.posterGradiantColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
        ),
        Positioned(
          bottom: 8 ,
          right: 0,
          left: 0,
          child: Column(
            children: [Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(" نویسنده : ${homePagePosterimg["writer"]}",style: TextStyle(color: Color.fromARGB(168, 255, 255, 255),fontWeight: FontWeight.w300,fontSize: 16,fontFamily: "bnazanin")),
                Row(
                  children: [
                    Text(homePagePosterimg["view"],style: TextStyle(color: Color.fromARGB(168, 255, 255, 255),fontWeight: FontWeight.w300,fontSize: 16,fontFamily: "bnazanin")),
                    SizedBox(width: 5,),
                    Icon(Icons.remove_red_eye_outlined,color: Color.fromARGB(152, 255, 255, 255),),
                  ],
                ),

              ],
            ),
              SizedBox(height: 10,),
              Text("${homePagePosterimg["title"]}", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,fontFamily: "bnazanin"),)
            ],
          ),
        )

      ],
    );
  }
}