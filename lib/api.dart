
import 'package:http/http.dart' as http;
import 'dart:convert';


 fetchBlogs() async {
 const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  const String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
  try {
    final response = await http.get(Uri.parse(url), headers: {
      'x-hasura-admin-secret': adminSecret,
    });
    
    if (response.statusCode == 200) {
      final  data = json.decode(response.body);
  
     final blogData = data['blogs'];
 
       final jsonData = json.encode(blogData);
      final blogs = json.decode(jsonData);
      return blogs;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception with the status code.
      throw Exception('Failed to load blogs: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any errors that occurred during the request
    print('Error: $e');
  }
}
