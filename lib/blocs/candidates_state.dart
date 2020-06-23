import 'package:a_job_thing_test/entities/candidate_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CandidatesState extends Equatable {
  const CandidatesState();
  @override
  List<Object> get props => [];
}

class InitialCandidatesState extends CandidatesState {}

class CandidatesLoading extends CandidatesState {}

class CandidatesLoaded extends CandidatesState {
  final List<Candidate> candidates;
  const CandidatesLoaded({@required this.candidates});
  @override
  List<Object> get props => [candidates];
}

class CandidatesLoadingFailure extends CandidatesState {
  final String failureMessage;
  const CandidatesLoadingFailure({@required this.failureMessage});
  @override
  List<Object> get props => [failureMessage];
}
