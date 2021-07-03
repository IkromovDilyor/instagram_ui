import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram/model/post_model.dart';
import 'package:instagram/model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story>_stories=[
    Story("assets/images/user_1.jpeg","Jazmin"),
    Story("assets/images/user_2.jpeg","Sylvester"),
    Story("assets/images/user_3.jpeg","Lavina"),
    Story("assets/images/user_1.jpeg","Jazmin"),
    Story("assets/images/user_2.jpeg","Sylvester"),
    Story("assets/images/user_3.jpeg","Jazmin"),
  ];
  List<Post>_post=[
Post("assets/images/user_1.jpeg", "Brianne", "assets/images/feed_1.jpeg","Consequatur nihil aliquid omnis consequatur "),
Post("assets/images/user_2.jpeg", "Henri", "assets/images/feed_2.jpeg","Consequatur nihil aliquid omnis consequatur "),
Post("assets/images/user_3.jpeg", "Mariano", "assets/images/feed_3.jpeg","Consequatur nihil aliquid omnis consequatur "),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
child: SingleChildScrollView(
  child: Column(
    children: [
      Divider(),
       //#Stories watch all
       Container(
         margin: EdgeInsets.symmetric(horizontal: 20),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("Stories",style: TextStyle(color: Colors.grey[300],fontSize: 14),),
             Text("Watch All",style: TextStyle(color: Colors.grey[300],fontSize: 14),),
           ],
         ),
       ),

      //#Story List

      Container(

        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 7),
        height: 106,
        child: ListView(
          scrollDirection:Axis.horizontal,
          shrinkWrap: true,
       children:_stories.map((story) {
         return _itemOfStory(story);
       }).toList(),
        ),

      ),

      //#PostList
      Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _post.length,
          itemBuilder: (ctx,i){
            return _itemOfPost(_post[i]);
          },
        ),
      ),


    ],
  ),
),
      ),

    );
  }
  Widget _itemOfPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          //#headr
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(40),
                    child: Image(image: AssetImage(post.userImage),
                    width: 40,
                      height: 40,
                      fit: BoxFit.cover ,
                    ),),
                    SizedBox(width:10,),
                    Text(post.usurname,style: TextStyle(color: Colors.grey[300]),),

                  ],
                ),
                IconButton(
                  icon:Icon(SimpleLineIcons.options,color: Colors.grey[300],),
                  onPressed: (){},
                ),
              ],
            ),
          ),
          FadeInImage(
            width:MediaQuery.of(context).size.width,
            image: AssetImage(post.postImage),
            placeholder: AssetImage("assets/images/placeholder.png"),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesome.heart_o,color: Colors.grey[300],),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesome.comment_o,color: Colors.grey[300]),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesome.send_o,color: Colors.grey[300]),
                  ),
                ],
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(FontAwesome.bookmark_o,color: Colors.grey[300]),
              ),

            ],
          ),
          //#tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  TextSpan(
                    text: "Sigmund,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " Yessenia,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " Dayana",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  TextSpan(
                    text: " 1263 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          //#caption
          Container(
          width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 5,
    ),
    child: RichText(
    softWrap: true,
    overflow: TextOverflow.visible,
    text: TextSpan(
    children: [
    TextSpan(
    text: post.usurname,
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white),
    ),
    TextSpan(
    text: " ${post.caption}",
    style: TextStyle(color: Colors.grey[400]),
    ),
    ],
    ),
    ),),
          // #post date
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              "Febuary 2020",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );

  }

Widget _itemOfStory(Story story){
    return Column(
      children: [
        Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),

            )
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.name,style: TextStyle(color: Colors.grey[300]),),
      ],
    );

}
}

