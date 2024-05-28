import 'package:consume_api/data/remote_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  RemoteService service;
  PostBloc(this.service) : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      emit(PostLoadingState());
      final result = await service.fetchPost();

      result.fold((error) => emit(PostFailed(error: error)), (postList) {
        emit(PostSuccessState(postList: postList));
      });
    });
  }
}
