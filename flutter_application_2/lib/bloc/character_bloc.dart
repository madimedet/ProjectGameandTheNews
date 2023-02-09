import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/data/repositories/character_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/character.dart';
part 'character_event.dart';
part 'character_state.dart';
part 'character_bloc.freezed.dart';


class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepo characterRepo;
  CharacterBloc({required this.characterRepo}) : super(const CharacterState.loading()) {
    on<CharacterEventFetch>((event, emit) async {
      emit(const CharacterState.loading());
      try{
Character _characterLoaded = await characterRepo.getCharacter(event.page, event.name);
      emit(CharacterState.loaded(characterLoaded: _characterLoaded));
      }catch(e){
        emit(const CharacterState.error());
      }

      
    });
  }
}
