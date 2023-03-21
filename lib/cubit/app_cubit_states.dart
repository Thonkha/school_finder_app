// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(
    this.schools,
  );
  final List<DataModel> schools;
  @override
  // TODO: implement props
  List<Object> get props => [schools];
}

class DetailState extends CubitStates {
  DetailState(
    this.school,
  );
  final DataModel school;
  @override
  // TODO: implement props
  List<Object> get props => [school];
}
