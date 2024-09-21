import 'package:bloc/bloc.dart';
import 'package:dozer_mobile/presentation/chatbot/domain/entities/search_assistant_response.dart';
import 'package:dozer_mobile/presentation/chatbot/domain/usecase/search_assistant_usecase.dart';
import 'package:equatable/equatable.dart';
part 'chat_bot_event.dart';
part 'chat_bot_state.dart';

class ChatBotBloc extends Bloc<ChatBotEvent, ChatBotState> {
  final SearchAssistantUseCase searchAssistantUseCase;
  ChatBotBloc(this.searchAssistantUseCase) : super(ChatBotInitial()) {
    on<ChatBotEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChatBotSendMessage>((event, emit) async {
      emit(ChatBotLoading());
      var res = await searchAssistantUseCase(Params(message: event.message));

      res.fold((l) => emit(ChatBotError(message: l.message)),
          (r) => emit(ChatBotLoaded(searchAssistantResponse: r)));
    });
    on<ImageUploadLoading>((event, emit) {
      emit(ChatBotLoading());
    });
  }
}
