import 'dart:math';

import 'package:ez_meditation_app/app/sounds_config.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/custom_progress_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stacked/stacked.dart';

import './sound_selection_view_model.dart';

class SoundSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SoundSelectionViewModel>.reactive(
      viewModelBuilder: () => SoundSelectionViewModel(),
      onModelReady: (SoundSelectionViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SoundSelectionViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).sound_appBarTitle),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Flexible(
                  child: ListView.separated(
                    itemCount: model.sounds.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 12),
                    separatorBuilder: (_, __) => Container(
                      height: 0.05,
                      color: jetBlack,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var sound = model.sounds[index];
                      return ListTile(
                          onTap: () => model.onSoundPressed(sound, index),
                          tileColor: Colors.white,
                          title: Text(sound.name),
                          trailing: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: model.selectedSound == sound
                                ? model.isBusy
                                    ? CustomProgressIndicator()
                                    : Icon(
                                        SFSymbols.checkmark,
                                        color: turkish,
                                        size: 24,
                                      )
                                : SizedBox.shrink(),
                          ));
                    },
                  ),
                ),
                if (kDebugMode) ControlButtons(model.player),
                if (kDebugMode)
                  StreamBuilder<Duration?>(
                    stream: model.player.durationStream,
                    builder: (context, snapshot) {
                      final duration = snapshot.data ?? Duration.zero;
                      return StreamBuilder<Duration>(
                        stream: model.player.positionStream,
                        builder: (context, snapshot) {
                          var position = snapshot.data ?? Duration.zero;
                          if (position > duration) {
                            position = duration;
                          }
                          return SeekBar(
                            duration: duration,
                            position: position,
                            onChangeEnd: (newPosition) {
                              model.player.seek(newPosition);
                            },
                          );
                        },
                      );
                    },
                  ),
                bigSpace,
              ],
            ));
      },
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  ControlButtons(this.player);
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        bigSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            bigSpace,
            StreamBuilder<PlayerState>(
              stream: player.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                final processingState = playerState?.processingState;
                final playing = playerState?.playing;
                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    width: 64.0,
                    height: 64.0,
                    child: CircularProgressIndicator(),
                  );
                } else if (playing != true) {
                  return IconButton(
                    icon: Icon(Icons.play_arrow),
                    iconSize: 64.0,
                    onPressed: player.play,
                  );
                } else if (processingState != ProcessingState.completed) {
                  return IconButton(
                    icon: Icon(Icons.pause),
                    iconSize: 64.0,
                    onPressed: player.pause,
                  );
                } else {
                  return Container();
                }
              },
            ),
            bigSpace,
          ],
        ),
      ],
    );
  }
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  SeekBar({
    required this.duration,
    required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Slider(
          min: 0.0,
          max: widget.duration.inMilliseconds.toDouble(),
          value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
              widget.duration.inMilliseconds.toDouble()),
          onChanged: (value) {
            setState(() {
              _dragValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(Duration(milliseconds: value.round()));
            }
          },
          onChangeEnd: (value) {
            if (widget.onChangeEnd != null) {
              widget.onChangeEnd!(Duration(milliseconds: value.round()));
            }
            _dragValue = null;
          },
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                      .firstMatch('$_remaining')
                      ?.group(1) ??
                  '$_remaining',
              style: Theme.of(context).textTheme.caption),
        ),
      ],
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}
