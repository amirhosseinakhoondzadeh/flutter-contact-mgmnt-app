import 'dart:async';

import 'package:a_job_thing_test/core/constants/constants.dart';
import 'package:a_job_thing_test/core/errors/failures.dart';
import 'package:a_job_thing_test/data/data_source.dart';
import 'package:a_job_thing_test/data/models/address.dart';
import 'package:a_job_thing_test/data/models/basic_info.dart';
import 'package:a_job_thing_test/data/models/contact.dart';
import 'package:a_job_thing_test/data/models/experience.dart';
import 'package:a_job_thing_test/entities/candidate_entity.dart';
import 'package:a_job_thing_test/helper/date_converter.dart';
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
    if (event is LoadCandidates) {
      yield* _mapLoadCandidatesToState();
    }
  }

  Stream<CandidatesState> _mapLoadCandidatesToState() async* {
    yield CandidatesLoading();

    try {
      final List<BasicInfo> basicInfoList =
          await _repository.fetchAllCandidatesBasicInfo();
      final List<Experience> experienceList =
          await _repository.fetchAllCandidatesExperience();
      final List<Contact> contactList =
          await _repository.fetchAllCandidatesContacts();
      final List<Address> addressList =
          await _repository.fetchAllCandidatesAddresses();
      if (basicInfoList.length == experienceList.length &&
          experienceList.length == contactList.length &&
          contactList.length == addressList.length) {
        final List<Candidate> candidateList = List(basicInfoList.length);
        for (var i = 0; i < basicInfoList.length; ++i) {
          candidateList[i] = Candidate(
              name: basicInfoList[i].name,
              id: basicInfoList[i].id,
              jobTitle: experienceList[i].jobTitle,
              status: experienceList[i].status,
              imagePath: basicInfoList[i].photo,
              city: addressList[i].city,
              email: contactList[i].email,
              phone: contactList[i].phone,
              state: addressList[i].state,
              zipCode: addressList[i].zipCode,
              address: addressList[i].address,
              industry: experienceList[i].industry,
              age: DateConverter.calculateAge(
                  DateConverter.convertDateStringToDateTime(
                      basicInfoList[i].birthday)));
        }
        yield CandidatesLoaded(candidates: candidateList);
      } else {
        yield CandidatesLoadingFailure(
            failureMessage: AppConstants.DEFAULT_ERROR_MESSAGE);
      }
    } on Failure catch (e) {
      yield CandidatesLoadingFailure(failureMessage: e.message);
    }
  }
}
