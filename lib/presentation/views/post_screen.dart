import 'package:consume_api/presentation/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    context.read<PostBloc>().add(FetchPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Post Screen"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostSuccessState) {
            return ListView.builder(
              itemCount: state.postList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: index % 2 == 1 ? Colors.green : Colors.lightBlue,
                  title: Text(state.postList[index].title ?? "This is title"),
                  subtitle: Text(
                    state.postList[index].body ?? "subtitle",
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
