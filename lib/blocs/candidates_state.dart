import 'package:equatable/equatable.dart';

abstract class CandidatesState extends Equatable {
  const CandidatesState();
}

class InitialCandidatesState extends CandidatesState {
  @override
  List<Object> get props => [];
}
