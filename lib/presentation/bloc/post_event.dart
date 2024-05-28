part of 'post_bloc.dart';

@immutable
sealed class PostEvent extends Equatable {}

class FetchPostEvent extends PostEvent {
  @override
  List<Object?> get props => [];
}
