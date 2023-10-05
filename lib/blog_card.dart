import 'package:blog_explorer/blog_detail.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BlogCard extends StatelessWidget {
  final String? id;
  final String? image;
  final String? title;

  const BlogCard({
    Key? key,
    this.id,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the details page and pass the blog ID
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailsPage(blogId: id,image: image,title: title,),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(16.0),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                    Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text('ID: $id'),
                        IconButton(onPressed: ()async{
                          Share.share(image!);
                        }, icon:const Icon(Icons.send))
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
