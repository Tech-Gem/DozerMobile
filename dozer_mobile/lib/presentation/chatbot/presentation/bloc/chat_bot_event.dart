part of 'chat_bot_bloc.dart';

abstract class ChatBotEvent extends Equatable {
  const ChatBotEvent();

  @override
  List<Object> get props => [];
}

class ChatBotSendMessage extends ChatBotEvent {
  final String message;

  ChatBotSendMessage({required this.message});

  @override
  List<Object> get props => [message];
}

class ChatBotImageSearch extends ChatBotEvent {
  final String url;

  ChatBotImageSearch({required this.url});

  @override
  List<Object> get props => [url];
}

class ImageUploadLoading extends ChatBotEvent {}
