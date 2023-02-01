import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:stacked/stacked.dart';

import './settings_view_model.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        SettingsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).settings_appBarTitle),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                        color: Theme.of(context).cardColor,
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: [
                            _SettingsSwitchTile(
                              text: S
                                  .of(context)
                                  .settings_screenOnWhileMeditating,
                              value: model.screenOn,
                              onChanged: model.onScreenOnChanged,
                            ),
                            _SettingsSwitchTile(
                              text: 'Play ending bell',
                              value: model.playEndingBell,
                              onChanged: model.onEndingBellChanged,
                            ),
                            // _SettingsSwitchTile(
                            //   text: S.of(context).settings_notifications,
                            //   value: model.notificationValue,
                            //   onChanged: model.onNotificationChanged,
                            // ),
                            _SettingsTile(
                              text: S.of(context).settings_rate,
                              onPressed: model.onRatePressed,
                            ),
                            // _SettingsTile(
                            //   text: S.of(context).settings_otherApps,
                            //   showChevron: true,
                            //   onPressed: model.onOtherAppsPressed,
                            // ),
                            // _SettingsTile(
                            //   text: S.of(context).settings_termsConditions,
                            //   showChevron: true,
                            //   onPressed: model.onTCPressed,
                            // ),
                            _SettingsTile(
                              text: S.of(context).settings_feedback,
                              onPressed: model.onFeedbackPressed,
                            ),
                            _SettingsTile(
                              text:
                                  S.of(context).settings_tileResetProgressData,
                              onPressed: model.onClearMediationDataPressed,
                            ),

                            if (model.isUserLoggedIn &&
                                model.user?.dynamicLink != null)
                              _SettingsTile(
                                text: S.current
                                    .settings_tileDisconnectFromCommunity,
                                onPressed: model.removeAllFriendsPressed,
                              ),
                          ],
                        )),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (model.isUserLoggedIn)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PrimaryButton(
                            onPressed: model.onLogoutPressed,
                            title: S.of(context).global_logout),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Version: ${model.version}'),
                    ),
                    smallSpace,
                  ],
                ),
              ],
            ));
      },
    );
  }
}

class _SettingsSwitchTile extends StatelessWidget {
  final String text;
  final Function(bool) onChanged;
  final bool value;

  const _SettingsSwitchTile(
      {Key? key,
      required this.text,
      required this.value,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SettingsTileBase(
      text: text,
      trailing: Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: turkish,
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool showChevron;
  final Widget? trailing;

  const _SettingsTile({
    Key? key,
    this.showChevron = false,
    required this.text,
    required this.onPressed,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(0),
      child: _SettingsTileBase(
        text: text,
        trailing: showChevron
            ? Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Icon(
                  SFSymbols.chevron_right,
                  size: 20,
                  color: soot,
                ),
              )
            : null,
      ),
    );
  }
}

class _SettingsTileBase extends StatelessWidget {
  final String text;
  final Widget? trailing;

  const _SettingsTileBase({
    Key? key,
    required this.text,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(
                text,
                style: title4.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
        Container(
          height: 0.03,
          color: jetBlack,
        ),
      ],
    );
  }
}
