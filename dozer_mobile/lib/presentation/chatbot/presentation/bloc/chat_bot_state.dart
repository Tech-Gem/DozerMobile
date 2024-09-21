part of 'chat_bot_bloc.dart';

abstract class ChatBotState extends Equatable {
  const ChatBotState();

  @override
  List<Object> get props => [];
}

class ChatBotInitial extends ChatBotState {}

class ChatBotLoading extends ChatBotState {}

class ChatBotLoaded extends ChatBotState {
  final SearchAssistantResponse searchAssistantResponse;

  ChatBotLoaded({required this.searchAssistantResponse});

  @override
  List<Object> get props => [searchAssistantResponse];
}

class ChatBotError extends ChatBotState {
  final String message;

  ChatBotError({required this.message});

  @override
  List<Object> get props => [message];
}
