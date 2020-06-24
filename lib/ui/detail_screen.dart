import 'dart:io';

import 'package:a_job_thing_test/core/constants/colors.dart';
import 'package:a_job_thing_test/core/constants/constants.dart';
import 'package:a_job_thing_test/core/constants/styles.dart';
import 'package:a_job_thing_test/entities/candidate_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Candidate candidate;

  DetailScreen({@required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PAGE_BACKGROUND_COLOR,
      body: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                color: Colors.black12,
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.3,
                  fit: BoxFit.cover,
                  imageUrl: candidate.imagePath ?? "",
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.transparent,
                  )),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2.7,
                  child: SafeArea(
                    top: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: GestureDetector(
                        onTap: () => _onBackButtonTapped(context),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            "assets/icons/ic_arrow_back.png",
                            width: 42,
                            height: 42,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _centerWidget(),
                ),
                Container(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _detailsWidget(
                      AppConstants.INDUSTRY, candidate.industry ?? "-",
                      textAlign: TextAlign.left),
                ),
                Container(
                  height: 16,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.black26,
                ),
                Container(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: _detailsWidget(
                            AppConstants.ADDRESS, candidate.address ?? "",
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        width: 4,
                      ),
                      Expanded(
                        child: _detailsWidget(AppConstants.ZIP_CODE,
                            "${candidate.zipCode ?? "-"}",
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: _detailsWidget(
                            AppConstants.CITY, candidate.city ?? "-",
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        width: 4,
                      ),
                      Expanded(
                        child: _detailsWidget(
                            AppConstants.STATE, candidate.state ?? "-",
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _centerWidget() {
    return Center(
      child: Material(
        elevation: 1,
        color: Colors.white,
        borderOnForeground: false,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                candidate.name ?? "-",
                style: const TextStyle(
                    fontFamily: AppConstants.APP_FONT_BOLD,
                    fontSize: 24,
                    color: AppColors.PAGE_TITLE_COLOR),
              ),
              Container(
                height: 8,
              ),
              Text(
                "${candidate.age ?? "-"}  Years Old",
                style: TextStyle(
                    fontFamily: AppConstants.APP_FONT_SEMI_BOLD,
                    fontSize: 18,
                    color: Colors.grey[600]),
              ),
              Container(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: _detailsWidget(
                          AppConstants.STATUS, candidate.status ?? "")),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 1,
                    height: 60,
                    color: Colors.grey[200],
                  ),
                  Expanded(
                      child: _detailsWidget(
                          AppConstants.JOB_TITLE, candidate.jobTitle))
                ],
              ),
              Container(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Spacer(
                    flex: 2,
                  ),
                  _centerIconButton(AppConstants.CALL_ICON, _onCallTapped),
                  Spacer(),
                  _centerIconButton(AppConstants.MAIL_ICON, _onEmailTapped),
                  Spacer(),
                  _centerIconButton(
                      AppConstants.WHATS_APP_ICON, _onWhatsAppTapped),
                  Spacer(
                    flex: 2,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _centerIconButton(String asset, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      splashColor: Colors.blueAccent.withOpacity(0.2),
      child: Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          asset,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            )
          ],
        ),
      ),
    );
  }

  Widget _detailsWidget(String title, String details,
      {textAlign = TextAlign.right}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(title, textAlign: textAlign, style: valueSemiBoldTextStyle),
        Container(
          height: 8,
        ),
        Text(details, textAlign: textAlign, style: detailsSemiBoldTextStyle),
      ],
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onCallTapped() {
    launch("tel://${candidate.phone}");
  }

  void _onEmailTapped() {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: '${candidate.email}',
        queryParameters: {AppConstants.SUBJECT: 'A Job Thing Test'});

    launch(_emailLaunchUri.toString());
  }

  void _onWhatsAppTapped() {
    launchWhatsApp(phone: candidate.phone, message: 'A Job Thing Test');
  }

  void launchWhatsApp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }
}
