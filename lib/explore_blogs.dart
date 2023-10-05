import 'package:blog_explorer/api.dart';
import 'package:blog_explorer/blog_card.dart';
import 'package:flutter/material.dart';

class ExploreBlogs extends StatefulWidget {
  const ExploreBlogs({super.key});

  @override
  State<ExploreBlogs> createState() => _ExploreBlogsState();
}

class _ExploreBlogsState extends State<ExploreBlogs> {
   List data =[] ;
  bool gotData = false;

  @override
  void initState() {
    super.initState();
    getBlogs();
  }

  Future getBlogs() async {
   await fetchBlogs().then((result) {
      setState(() {
        data = result;
        gotData = true;
        
      });
    }); 
    return ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
     
      body:
       !gotData?Container()
      :
       Center(child: Scrollbar(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder:(BuildContext context,int index){
              final blog = data [index];
              return BlogCard(
                id: blog['id'],
                image: blog['image_url'],
                title: blog['title'],
              );            
          },
          
          ),
         
          ),
          ),
          backgroundColor: Color.fromRGBO(239, 239, 239, 1)
    );
  }
}