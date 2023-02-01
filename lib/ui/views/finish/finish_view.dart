import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/views/progress/progress_view.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './finish_view_model.dart';

class FinishView extends StatefulWidget {
  @override
  _FinishViewState createState() => _FinishViewState();
}

class _FinishViewState extends State<FinishView> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 5));

    _controllerCenter.play();

    Future.delayed(Duration(seconds: 5), () => _controllerCenter.stop());
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    // ignore: omit_local_variable_types
    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FinishViewModel>.reactive(
      viewModelBuilder: () => FinishViewModel(),
      onModelReady: (FinishViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        FinishViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            appBar: AppBar(),
            body: Stack(
              children: [
                ListView(
                  children: [
                    _buildHeaderCard(context, model),
                    ProgressView(),
                    _buildDiscardButton(context, model),
                  ],
                ),
                _buildConfetti(),
              ],
            ));
      },
    );
  }

  Align _buildConfetti() {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: _controllerCenter,
        blastDirectionality: BlastDirectionality
            .explosive, // don't specify a direction, blast randomly
        shouldLoop: true, // start again as soon as the animation is finished
        colors: const [
          jetBlack,
          puter,
          soot,
          turkish
        ], // manually specify the colors to be used
        createParticlePath: drawStar, // define a custom shape/path.
      ),
    );
  }

  PrimaryButton _buildDiscardButton(
      BuildContext context, FinishViewModel model) {
    return PrimaryButton(
      onPressed: model.onDiscardPressed,
      title: S.of(context).finish_discardSession,
      textStyle: title3.copyWith(color: Colors.white),
    );
  }

  Widget _buildHeaderCard(BuildContext context, FinishViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: TextLiquidFill(
                    text: S.of(context).finish_successMessage,
                    waveColor: jetBlack,
                    boxBackgroundColor: Theme.of(context).cardColor,
                    textStyle: TextStyle(
                      fontSize: 60.0,
                      color: turkish,
                      fontWeight: FontWeight.bold,
                    ),
                    waveDuration: Duration(milliseconds: 1000),
                    boxHeight: 100,
                  ),
                ),
                smallSpace,
                Text(S.of(context).finish_meditationDurationTitle),
                bigSpace,
                Text(
                  prettySessionDuration(model.lastSession.durationInSeconds),
                  style: title2.copyWith(fontWeight: FontWeight.bold),
                ),
                bigSpace,
              ],
            ),
          )),
    );
  }
}
