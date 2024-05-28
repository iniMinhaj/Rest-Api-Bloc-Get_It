part of 'post_bloc.dart';

@immutable
sealed class PostState extends Equatable {}

final class PostInitial extends PostState {
  @override
  List<Object?> get props => [];
}

final class PostLoadingState extends PostState {
  @override
  List<Object?> get props => [];
}

final class PostSuccessState extends PostState {
  final List<PostModel> postList;

  PostSuccessState({required this.postList});

  @override
  List<Object?> get props => [postList];
}

final class PostFailed extends PostState {
  final String error;

  PostFailed({required this.error});

  @override
  List<Object?> get props => [];
}
