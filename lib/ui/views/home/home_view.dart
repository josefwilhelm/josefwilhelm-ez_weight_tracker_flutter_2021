import 'package:duration/locale.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/views/home/home_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:duration/duration.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 12),
              child: IconButton(
                onPressed: model.onProfilePressed,
                icon: Icon(
                  SFSymbols.person_fill,
                  size: 32,
                ),
              ),
            ),
            actions: [
              if (kDebugMode) debugButton(),
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: IconButton(
                  onPressed: model.onSettingsPressed,
                  icon: Icon(
                    SFSymbols.gear_alt_fill,
                    size: 32,
                  ),
                ),
              )
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStartButton(model, context),
              bigSpace,
              _buildSettings(model, context),
              bigSpace,
              bigSpace,
              bigSpace
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettings(HomeViewModel model, BuildContext context) {
    return Builder(
      builder: (context) => Theme(
        data: ThemeData(
          accentColor: jetBlack,
          primaryColor: jetBlack,
          buttonColor: jetBlack,
          buttonTheme: ButtonThemeData(
            buttonColor: jetBlack,
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            primary: jetBlack,
          )),
          buttonBarTheme: ButtonBarThemeData(
            buttonTextTheme: ButtonTextTheme.primary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              Builder(
                builder: (context) => _SettingsTile(
                  iconData: SFSymbols.hourglass_bottomhalf_fill,
                  title: printDuration(
                    model.duration,
                    locale: DurationLocale.fromLanguageCode(
                            Get.locale?.languageCode ?? 'en') ??
                        EnglishDurationLocale(),
                  ),
                  onPressed: () async {
                    final time = await showDurationPicker(
                      context: context,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: fog,
                      ),
                      initialTime: model.duration,
                    );
                    model.onTimerSettingsChanged(time);
                  },
                ),
              ),
              _SettingsTile(
                iconData: SFSymbols.music_note,
                title: model.selectedSound,
                onPressed: model.onBackgroundSoundPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton(HomeViewModel model, BuildContext context) {
    return GestureDetector(
      onTap: model.onStartPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/puddle.png',
            width: MediaQuery.of(context).size.width * 0.65,
          ),
          Center(
            child: Text(
              S.of(context).timer_startButtonTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData iconData;

  const _SettingsTile({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: MaterialButton(
        color: fog,
        onPressed: onPressed,
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 12, 0, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                iconData,
                size: 22,
              ),
              Row(
                children: <Widget>[
                  Text(
                    title,
                    style: title4,
                  ),
                  smallSpace,
                  Icon(
                    SFSymbols.chevron_right,
                    size: 22,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
