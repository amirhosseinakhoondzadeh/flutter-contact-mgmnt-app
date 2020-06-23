import 'dart:async';

import 'package:a_job_thing_test/data/data_source.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';

class CandidatesBloc extends Bloc<CandidatesEvent, CandidatesState> {
  final DataSource _repository;

  CandidatesBloc({@required DataSource dataSource})
      : assert(dataSource != null),
        _repository = dataSource;

  @override
  CandidatesState get initialState => InitialCandidatesState();

  @override
  Stream<CandidatesState> mapEventToState(
    CandidatesEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
