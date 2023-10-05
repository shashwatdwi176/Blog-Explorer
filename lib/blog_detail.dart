import 'package:flutter/material.dart';

class BlogDetailsPage extends StatelessWidget {
  final String? blogId;
 final String? image;
 final String? title;
  const BlogDetailsPage({Key? key, this.blogId, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
   

    return Scaffold(
      
      body: Center(
        child: ListView(
          children: [
            Center(child: Text(title!,style: TextStyle(fontSize: 50),)),
            Image.network(image!),
            Center(child: Text(blogId!),)
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(239, 239, 239, 1)
    );
  }
}
 