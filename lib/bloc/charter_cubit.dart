import 'package:bloc/bloc.dart';
import 'package:endpoint2/helper/api_helper.dart';
import 'package:endpoint2/modal/add_charter_modal.dart';

import '../Modal/charter_list.dart';

class CharterCubit extends Cubit<CharterState> {
  CharterCubit(super.initialState) {
    login();
  }

  login() async {
    var res = await APIHelper().loginApi();
  }

  getCharterList(String char) async {
    emit(state.copyWith(
        charterReqState: state.charterReqState = CharterReqState.LOADING));
    var res = await APIHelper().getCharterList(char);
    if (res is String) {
      emit(state.copyWith(charterList: CharterList()));
    } else {
      emit(state.copyWith(charterList: res));
    }

    emit(state.copyWith(
        charterReqState: state.charterReqState = CharterReqState.DONE));
  }

  addCharter(
      AddCharter addCharter) {
    emit(state.copyWith(
        charterReqState: state.charterReqState = CharterReqState.LOADING));
    var res = APIHelper().addCharter(addCharter);
    emit(state.copyWith(
        charterReqState: state.charterReqState = CharterReqState.DONE));
    return res;
  }
}

enum CharterReqState { NONE, LOADING, ERROR, DONE }

class CharterState {
  CharterList? charterList = CharterList();
  CharterReqState charterReqState;

  CharterState({
    this.charterList,
    this.charterReqState = CharterReqState.NONE,
  });

  CharterState copyWith({
    CharterList? charterList,
    CharterReqState? charterReqState,
  }) {
    return CharterState(
      charterList: charterList ?? this.charterList,
      charterReqState: charterReqState ?? this.charterReqState,
    );
  }
}
