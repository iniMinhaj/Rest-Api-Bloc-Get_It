import 'package:dartz/dartz.dart';
import 'model/post_model.dart';
import 'package:http/http.dart' as http;

const postUrl = "https://jsonplaceholder.typicode.com/posts";

class RemoteService {
  Future<Either<String, List<PostModel>>> fetchPost() async {
    try {
      final response = await http.get(Uri.parse(postUrl));
      print("response = $response");
      if (response.statusCode == 200) {
        final data = postModelFromJson(response.body);
        final postList = data.map((e) => e).toList();
        return Right(postList);
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
