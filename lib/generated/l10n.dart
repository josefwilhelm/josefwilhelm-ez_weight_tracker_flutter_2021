// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Something happened!`
  String get globalErrorNoticePrefix {
    return Intl.message(
      'Something happened!',
      name: 'globalErrorNoticePrefix',
      desc: '',
      args: [],
    );
  }

  /// `Authentication failed!`
  String get globalErrorNoticeAuthenticateFailed {
    return Intl.message(
      'Authentication failed!',
      name: 'globalErrorNoticeAuthenticateFailed',
      desc: '',
      args: [],
    );
  }

  /// `failed to connect to our server, please try again in few minutes.`
  String get globalErrorNoticeNetworkProblem {
    return Intl.message(
      'failed to connect to our server, please try again in few minutes.',
      name: 'globalErrorNoticeNetworkProblem',
      desc: '',
      args: [],
    );
  }

  /// `no user found. The user may have been deleted.`
  String get globalErrorNoticeUserNotFound {
    return Intl.message(
      'no user found. The user may have been deleted.',
      name: 'globalErrorNoticeUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `incorrect password.`
  String get globalErrorNoticeInvalidPassword {
    return Intl.message(
      'incorrect password.',
      name: 'globalErrorNoticeInvalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `too many failed login attempt please try again later.`
  String get globalErrorNoticeTooManyAttempt {
    return Intl.message(
      'too many failed login attempt please try again later.',
      name: 'globalErrorNoticeTooManyAttempt',
      desc: '',
      args: [],
    );
  }

  /// `we will miss you!`
  String get globalNotificationNoticeDeleteSuccessfulTitle {
    return Intl.message(
      'we will miss you!',
      name: 'globalNotificationNoticeDeleteSuccessfulTitle',
      desc: '',
      args: [],
    );
  }

  /// `you can comeback anytime you want, we will waiting`
  String get globalNotificationNoticeDeleteSuccessfulDescription {
    return Intl.message(
      'you can comeback anytime you want, we will waiting',
      name: 'globalNotificationNoticeDeleteSuccessfulDescription',
      desc: '',
      args: [],
    );
  }

  /// `You have logged out successfully`
  String get globalNotificationLogoutTitle {
    return Intl.message(
      'You have logged out successfully',
      name: 'globalNotificationLogoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get settings_feedback {
    return Intl.message(
      'Feedback',
      name: 'settings_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get settings_termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'settings_termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Other apps`
  String get settings_otherApps {
    return Intl.message(
      'Other apps',
      name: 'settings_otherApps',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get settings_rate {
    return Intl.message(
      'Rate',
      name: 'settings_rate',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get settings_notifications {
    return Intl.message(
      'Notifications',
      name: 'settings_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Screen on while meditating`
  String get settings_screenOnWhileMeditating {
    return Intl.message(
      'Screen on while meditating',
      name: 'settings_screenOnWhileMeditating',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_appBarTitle {
    return Intl.message(
      'Settings',
      name: 'settings_appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get global_login {
    return Intl.message(
      'Login',
      name: 'global_login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get globel_register {
    return Intl.message(
      'Register',
      name: 'globel_register',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registration_appBarTitle {
    return Intl.message(
      'Registration',
      name: 'registration_appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `* Field required`
  String get global_warningFieldRequired {
    return Intl.message(
      '* Field required',
      name: 'global_warningFieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Min. 6 characters`
  String get password_minLengthWarning {
    return Intl.message(
      'Min. 6 characters',
      name: 'password_minLengthWarning',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get password_doNotMatchWarning {
    return Intl.message(
      'Passwords do not match',
      name: 'password_doNotMatchWarning',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email address`
  String get email_notValidWarning {
    return Intl.message(
      'Please check your email address',
      name: 'email_notValidWarning',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get global_username {
    return Intl.message(
      'Username',
      name: 'global_username',
      desc: '',
      args: [],
    );
  }

  /// `Enter username`
  String get global_usernameHint {
    return Intl.message(
      'Enter username',
      name: 'global_usernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get global_email {
    return Intl.message(
      'Email',
      name: 'global_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get global_emailHint {
    return Intl.message(
      'Enter email address',
      name: 'global_emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get global_password {
    return Intl.message(
      'Password',
      name: 'global_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get global_passwordHint {
    return Intl.message(
      'Enter Password',
      name: 'global_passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get global_confirmPasswordHint {
    return Intl.message(
      'Confirm password',
      name: 'global_confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_appBarTitle {
    return Intl.message(
      'Profile',
      name: 'profile_appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get profile_profileTabTitle {
    return Intl.message(
      'My Profile',
      name: 'profile_profileTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get profile_communityTabTitle {
    return Intl.message(
      'Community',
      name: 'profile_communityTabTitle',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get global_logout {
    return Intl.message(
      'Logout',
      name: 'global_logout',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get profile_usernamePlaceholder {
    return Intl.message(
      'Username',
      name: 'profile_usernamePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Codename`
  String get profile_calloutPlaceholder {
    return Intl.message(
      'Codename',
      name: 'profile_calloutPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Codename`
  String get profile_subtitlePlaceholder {
    return Intl.message(
      'Codename',
      name: 'profile_subtitlePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get global_edit {
    return Intl.message(
      'Edit',
      name: 'global_edit',
      desc: '',
      args: [],
    );
  }

  /// `Let's get started!`
  String get authenticationSheet_title {
    return Intl.message(
      'Let\'s get started!',
      name: 'authenticationSheet_title',
      desc: '',
      args: [],
    );
  }

  /// `or log in with`
  String get authenticationSheet_socialMediaTitle {
    return Intl.message(
      'or log in with',
      name: 'authenticationSheet_socialMediaTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_appBarTitle {
    return Intl.message(
      'Login',
      name: 'login_appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get global_info {
    return Intl.message(
      'Info',
      name: 'global_info',
      desc: '',
      args: [],
    );
  }

  /// `You have logged out successfully.`
  String get logout_successMessage {
    return Intl.message(
      'You have logged out successfully.',
      name: 'logout_successMessage',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get editProfile_appBarTitle {
    return Intl.message(
      'Edit',
      name: 'editProfile_appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get timer_startButtonTitle {
    return Intl.message(
      'Start',
      name: 'timer_startButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get sound_appBarTitle {
    return Intl.message(
      'Sound',
      name: 'sound_appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get global_cancel {
    return Intl.message(
      'Cancel',
      name: 'global_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Discard`
  String get finish_discardDialogButton {
    return Intl.message(
      'Discard',
      name: 'finish_discardDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Discard session?`
  String get finish_discardDialogTitle {
    return Intl.message(
      'Discard session?',
      name: 'finish_discardDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Well done!`
  String get finish_successMessage {
    return Intl.message(
      'Well done!',
      name: 'finish_successMessage',
      desc: '',
      args: [],
    );
  }

  /// `You meditated for`
  String get finish_meditationDurationTitle {
    return Intl.message(
      'You meditated for',
      name: 'finish_meditationDurationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Discard Session`
  String get finish_discardSession {
    return Intl.message(
      'Discard Session',
      name: 'finish_discardSession',
      desc: '',
      args: [],
    );
  }

  /// `No sound`
  String get sounds_noSound {
    return Intl.message(
      'No sound',
      name: 'sounds_noSound',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get global_success {
    return Intl.message(
      'Success',
      name: 'global_success',
      desc: '',
      args: [],
    );
  }

  /// `Yay! You just added a friend!`
  String get community_addFriendMessage {
    return Intl.message(
      'Yay! You just added a friend!',
      name: 'community_addFriendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ez Meditation - Community Feature`
  String get community_shareEmbeddedSocialMediaTitle {
    return Intl.message(
      'Ez Meditation - Community Feature',
      name: 'community_shareEmbeddedSocialMediaTitle',
      desc: '',
      args: [],
    );
  }

  /// `Share this link with your friends to see their meditation stats.`
  String get community_shareEmbeddedSocialMediaDescription {
    return Intl.message(
      'Share this link with your friends to see their meditation stats.',
      name: 'community_shareEmbeddedSocialMediaDescription',
      desc: '',
      args: [],
    );
  }

  /// `Oops! We could not find the friend you were looking for.`
  String get community_errorNoUser {
    return Intl.message(
      'Oops! We could not find the friend you were looking for.',
      name: 'community_errorNoUser',
      desc: '',
      args: [],
    );
  }

  /// `Oops! You must be logged in to add a friend.`
  String get community_errorNotLoggedIn {
    return Intl.message(
      'Oops! You must be logged in to add a friend.',
      name: 'community_errorNotLoggedIn',
      desc: '',
      args: [],
    );
  }

  /// `Add friends by sharing your personal link.`
  String get community_linkHeader {
    return Intl.message(
      'Add friends by sharing your personal link.',
      name: 'community_linkHeader',
      desc: '',
      args: [],
    );
  }

  /// `Link copied to clipboard.`
  String get community_copyToClipboardMessage {
    return Intl.message(
      'Link copied to clipboard.',
      name: 'community_copyToClipboardMessage',
      desc: '',
      args: [],
    );
  }

  /// `Disconnect from community?`
  String get communnity_disconnectDialogTitle {
    return Intl.message(
      'Disconnect from community?',
      name: 'communnity_disconnectDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `You will not be able to view your friends' progress, and they won't be able to view yours.`
  String get communnity_disconnectDialogMessage {
    return Intl.message(
      'You will not be able to view your friends\' progress, and they won\'t be able to view yours.',
      name: 'communnity_disconnectDialogMessage',
      desc: '',
      args: [],
    );
  }

  /// `Disconnect`
  String get communnity_disconnectDialogButton {
    return Intl.message(
      'Disconnect',
      name: 'communnity_disconnectDialogButton',
      desc: '',
      args: [],
    );
  }

  /// `Yay!`
  String get snackbar_success {
    return Intl.message(
      'Yay!',
      name: 'snackbar_success',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for your feedback!`
  String get feedback_submitMessageSnackbar {
    return Intl.message(
      'Thanks for your feedback!',
      name: 'feedback_submitMessageSnackbar',
      desc: '',
      args: [],
    );
  }

  /// `Reset progress data?`
  String get settings_resetProgressDataDialogTitle {
    return Intl.message(
      'Reset progress data?',
      name: 'settings_resetProgressDataDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get settings_resetProgressButtonTitle {
    return Intl.message(
      'Reset',
      name: 'settings_resetProgressButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `All of your data will be reset to 0.`
  String get settings_resetProgressDataDialogMessage {
    return Intl.message(
      'All of your data will be reset to 0.',
      name: 'settings_resetProgressDataDialogMessage',
      desc: '',
      args: [],
    );
  }

  /// `Disconnect from community`
  String get settings_tileDisconnectFromCommunity {
    return Intl.message(
      'Disconnect from community',
      name: 'settings_tileDisconnectFromCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Reset progress data`
  String get settings_tileResetProgressData {
    return Intl.message(
      'Reset progress data',
      name: 'settings_tileResetProgressData',
      desc: '',
      args: [],
    );
  }

  /// `This session will not be added to your progress data.`
  String get finish_discardDialogMessage {
    return Intl.message(
      'This session will not be added to your progress data.',
      name: 'finish_discardDialogMessage',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get progressView_progressTitle {
    return Intl.message(
      'Progress',
      name: 'progressView_progressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send feedback`
  String get feedback_dialogTitle {
    return Intl.message(
      'Send feedback',
      name: 'feedback_dialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your email (optional)`
  String get feedback_dialogEmailLabel {
    return Intl.message(
      'Your email (optional)',
      name: 'feedback_dialogEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Your feedback`
  String get feedback_dialogFeedbackLabel {
    return Intl.message(
      'Your feedback',
      name: 'feedback_dialogFeedbackLabel',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get feedback_dialogPrimaryButton {
    return Intl.message(
      'Send',
      name: 'feedback_dialogPrimaryButton',
      desc: '',
      args: [],
    );
  }

  /// `Session Log`
  String get profile_sessionLogButton {
    return Intl.message(
      'Session Log',
      name: 'profile_sessionLogButton',
      desc: '',
      args: [],
    );
  }

  /// `EZ Timer`
  String get sessionLog_entryTypeTimer {
    return Intl.message(
      'EZ Timer',
      name: 'sessionLog_entryTypeTimer',
      desc: '',
      args: [],
    );
  }

  /// `Logged manually`
  String get sessionLog_entryTypeSessionLog {
    return Intl.message(
      'Logged manually',
      name: 'sessionLog_entryTypeSessionLog',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get community_friendsCardsTitle {
    return Intl.message(
      'Friends',
      name: 'community_friendsCardsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete Friend`
  String get community_deleteFriendsButton {
    return Intl.message(
      'Delete Friend',
      name: 'community_deleteFriendsButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get authenticationSheet_googleButton {
    return Intl.message(
      'Sign in with Google',
      name: 'authenticationSheet_googleButton',
      desc: '',
      args: [],
    );
  }

  /// `This feature is only available if you are logged in.`
  String get community_loggedOutText1 {
    return Intl.message(
      'This feature is only available if you are logged in.',
      name: 'community_loggedOutText1',
      desc: '',
      args: [],
    );
  }

  /// `Much sorry \nso wow!`
  String get community_loggedOutText2 {
    return Intl.message(
      'Much sorry \nso wow!',
      name: 'community_loggedOutText2',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, one{day} other{days}}`
  String daysCount(num count) {
    return Intl.plural(
      count,
      one: 'day',
      other: 'days',
      name: 'daysCount',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one{minute} other{minutes}}`
  String minutesCount(num count) {
    return Intl.plural(
      count,
      one: 'minute',
      other: 'minutes',
      name: 'minutesCount',
      desc: '',
      args: [count],
    );
  }

  /// `Current streak`
  String get progress_currentStreak {
    return Intl.message(
      'Current streak',
      name: 'progress_currentStreak',
      desc: '',
      args: [],
    );
  }

  /// `Max streak`
  String get progress_maxStreak {
    return Intl.message(
      'Max streak',
      name: 'progress_maxStreak',
      desc: '',
      args: [],
    );
  }

  /// `Total sessions`
  String get progress_totalSessions {
    return Intl.message(
      'Total sessions',
      name: 'progress_totalSessions',
      desc: '',
      args: [],
    );
  }

  /// `Average session`
  String get progress_averageSession {
    return Intl.message(
      'Average session',
      name: 'progress_averageSession',
      desc: '',
      args: [],
    );
  }

  /// `Minimum timer length is 1 min.`
  String get snackbar_minSessionLengthInfo {
    return Intl.message(
      'Minimum timer length is 1 min.',
      name: 'snackbar_minSessionLengthInfo',
      desc: '',
      args: [],
    );
  }

  /// `Session Log`
  String get sessionLog_appBarTitle {
    return Intl.message(
      'Session Log',
      name: 'sessionLog_appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `No sound`
  String get sound_noSound {
    return Intl.message(
      'No sound',
      name: 'sound_noSound',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
