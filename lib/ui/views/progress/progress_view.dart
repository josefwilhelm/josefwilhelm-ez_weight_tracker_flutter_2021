import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './progress_view_model.dart';

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProgressViewModel>.reactive(
      viewModelBuilder: () => ProgressViewModel(),
      onModelReady: (ProgressViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        ProgressViewModel model,
        Widget? child,
      ) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
              child:
                  Text(S.of(context).progressView_progressTitle, style: title3),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              crossAxisCount: 2,
              childAspectRatio: 5 / 4,
              crossAxisSpacing: 3,
              mainAxisSpacing: 4,
              shrinkWrap: true,
              children: [
                _ProgressCard(
                  unit: Text(S.of(context).daysCount(model.currentStreak)),
                  count: model.currentStreak.toString(),
                  label: S.of(context).progress_currentStreak,
                ),
                _ProgressCard(
                  unit: Text(S.of(context).daysCount(model.maxStreak)),
                  count: model.maxStreak.toString(),
                  label: S.of(context).progress_maxStreak,
                ),
                _ProgressCard(
                  unit: Container(),
                  count: model.sessions.length.toString(),
                  label: S.of(context).progress_totalSessions,
                ),
                _ProgressCard(
                  unit: Text(S.of(context).minutesCount(
                      model.meditationService.averageSessionLength ~/ 60)),
                  count: (model.meditationService.averageSessionLength ~/ 60)
                      .toString(),
                  label: S.of(context).progress_averageSession,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final String label;
  final String count;
  final Widget unit;

  const _ProgressCard({
    Key? key,
    required this.label,
    required this.count,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              label,
              style: title4.copyWith(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
            mediumSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  count,
                  style: TextStyle(fontSize: 36),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: unit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
