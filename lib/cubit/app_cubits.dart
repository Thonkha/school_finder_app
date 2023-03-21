import 'package:bloc/bloc.dart';
import 'package:school_finder_app/cubit/app_cubit_states.dart';
import 'package:school_finder_app/model/data_model.dart';
import 'package:school_finder_app/pages/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final schools;
  void getData() async {
    try {
      emit(LoadingState());
      schools = await data.getInfo();
      emit(LoadedState(schools));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(schools));
  }
}
