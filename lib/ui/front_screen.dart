import 'package:a_job_thing_test/blocs/bloc.dart';
import 'package:a_job_thing_test/core/constants/colors.dart';
import 'package:a_job_thing_test/core/constants/constants.dart';
import 'package:a_job_thing_test/entities/candidate_entity.dart';
import 'package:a_job_thing_test/router.dart';
import 'package:a_job_thing_test/ui/error_screen.dart';
import 'package:a_job_thing_test/widgets/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../dependency_injector.dart';

class FrontScreen extends StatefulWidget {
  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  final _bloc = sl<CandidatesBloc>();

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  @override
  void initState() {
    _bloc.add(LoadCandidates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.PAGE_BACKGROUND_COLOR,
        elevation: 0,
      ),
      backgroundColor: AppColors.PAGE_BACKGROUND_COLOR,
      body: BlocListener<CandidatesBloc, CandidatesState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is CandidatesLoadingFailure) {
            showDialog(
                context: context,
                builder: (context) => ErrorPreviewScreen(
                    message: state.failureMessage,
                    title: state.title,
                    onTryAgain: () {
                      Navigator.of(context).pop();
                      _bloc.add(LoadCandidates());
                    }));
          }
        },
        child: BlocBuilder<CandidatesBloc, CandidatesState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is CandidatesLoading) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (state is CandidatesLoaded) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 0, right: 16, left: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      AppConstants.FRONT_SCREEN_TITLE,
                      style: const TextStyle(
                        color: AppColors.PAGE_TITLE_COLOR,
                        fontFamily: AppConstants.APP_FONT_BOLD,
                        fontSize: 32,
                      ),
                    ),
                    Container(
                      height: 32,
                    ),
                    Expanded(
                      child: LiquidPullToRefresh(
                        key: _refreshIndicatorKey,
                        showChildOpacityTransition: false,
                        onRefresh: () =>
                            Future(() => _bloc.add(LoadCandidates())),
                        child: ListView.builder(
                          itemBuilder: (context, index) =>
                              CandidateListItemWidget(
                            state.candidates[index],
                            onItemTapped: () => _onCandidateSelected(
                                state.candidates[index], context),
                          ),
                          itemCount: state.candidates.length,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    AppConstants.FRONT_SCREEN_TITLE,
                    style: const TextStyle(
                      color: AppColors.PAGE_TITLE_COLOR,
                      fontFamily: AppConstants.APP_FONT_BOLD,
                      fontSize: 32,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _onCandidateSelected(Candidate candidate, BuildContext context) {
    Navigator.of(context).pushNamed(Router.DETAIL, arguments: candidate);
  }
}

class CandidateListItemWidget extends StatelessWidget {
  final Candidate item;
  final VoidCallback onItemTapped;

  CandidateListItemWidget(this.item, {@required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTapped,
      child: Card(
        elevation: 1,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              RoundedImageWidget(
                imagePath: item.imagePath,
              ),
              Container(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name ?? "",
                      style: const TextStyle(
                        color: AppColors.PAGE_TITLE_COLOR,
                        fontFamily: AppConstants.APP_FONT_BOLD,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      item.status ?? "",
                      style: const TextStyle(
                        color: AppColors.PAGE_TITLE_COLOR,
                        fontFamily: AppConstants.APP_FONT_MEDIUM,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      item.jobTitle ?? "",
                      style: const TextStyle(
                        color: AppColors.PAGE_TITLE_COLOR,
                        fontFamily: AppConstants.APP_FONT_REGULAR,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
