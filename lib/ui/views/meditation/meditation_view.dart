import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:stacked/stacked.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import './meditation_view_model.dart';

class MeditationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeditationViewModel>.reactive(
      viewModelBuilder: () => MeditationViewModel(),
      onModelReady: (MeditationViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MeditationViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            backgroundColor: jetBlack,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: model.isWarmupDone
                        ? _buildMeditationTimer(model, context)
                        : _buildWarmupTimer(model),
                  ),
                  if (model.isWarmupDone)
                    Flexible(child: _buildButtonContainer(model, context)),
                ],
              ),
            ));
      },
    );
  }

  Widget _buildMeditationTimer(
      MeditationViewModel model, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: CircularCountDownTimer(
        duration: model.duration.inSeconds,
        controller: model.meditationTimeController,
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.7,
        ringColor: jetBlack,
        ringGradient: RadialGradient(
          colors: [
            Colors.white,
            jetBlack,
          ],
        ),
        fillColor: fog,
        fillGradient: RadialGradient(
          colors: [
            jetBlack,
            Colors.white,
          ],
        ),
        backgroundColor: jetBlack,
        backgroundGradient: null,
        strokeWidth: 16.0,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
            color: fog,
            letterSpacing: 3,
            fontWeight: FontWeight.w500,
            fontSize: 44),
        textFormat: CountdownTextFormat.HH_MM_SS,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: true,
        onStart: () {
          print('Countdown Started');
        },
        onComplete: () {
          model.onMeditationTimerFinished();
          print('Countdown Ended');
        },
      ),
    );
    // return _TimerWidget(
    //   duration: model.duration,
    //   onFinished: model.onMeditationTimerFinished,
    //   controller: model.meditationTimeController,
    // );
  }

  Widget _buildWarmupTimer(MeditationViewModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Warm up',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        mediumSpace,
        _TimerWidget(
          duration: model.warmUpDuration,
          controller: model.warmUpController,
          onFinished: model.onWarmupFinished,
        ),
      ],
    );
  }

  Widget _buildButtonContainer(
      MeditationViewModel model, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        if (model.isPaused)
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              children: <Widget>[
                smallSpace,
                PrimaryButton(
                  onPressed: model.onMeditationTimerFinished,
                  title: 'End',
                  textStyle: title3,
                  color: turkish,
                )
              ],
            ),
          ),
        mediumSpace,
        IconButton(
            onPressed: model.togglePause,
            iconSize: 50,
            icon: Icon(
              model.isPaused ? SFSymbols.play_fill : SFSymbols.pause_fill,
              color: Colors.white,
            )),
        bigSpace,
      ],
    );
  }
}

class _TimerWidget extends StatelessWidget {
  final Duration duration;
  final VoidCallback onFinished;
  final CountdownController controller;

  const _TimerWidget({
    Key? key,
    required this.duration,
    required this.onFinished,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: duration.inSeconds,
      build: (BuildContext context, double time) {
        final dur = Duration(seconds: time.toInt());
        final hours = dur.inHours;
        final minutes = dur.inMinutes;
        final seconds = dur.inSeconds % 60;
        return Text(
            '${hours.toString().padLeft(02, '0')}:${minutes.toString().padLeft(02, '0')}:${seconds.toString().padLeft(02, '0')}',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: fog,
                letterSpacing: 3,
                fontWeight: FontWeight.w500,
                fontSize: 50));
      },
      controller: controller,
      interval: Duration(milliseconds: 100),
      onFinished: onFinished,
    );
  }
}
