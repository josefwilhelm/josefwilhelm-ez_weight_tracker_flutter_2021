// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "${Intl.plural(count, one: 'day', other: 'days')}";

  static String m1(count) =>
      "${Intl.plural(count, one: 'minute', other: 'minutes')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authenticationSheet_googleButton":
            MessageLookupByLibrary.simpleMessage("Sign in with Google"),
        "authenticationSheet_socialMediaTitle":
            MessageLookupByLibrary.simpleMessage("or log in with"),
        "authenticationSheet_title":
            MessageLookupByLibrary.simpleMessage("Let\'s get started!"),
        "community_addFriendMessage": MessageLookupByLibrary.simpleMessage(
            "Yay! You just added a friend!"),
        "community_copyToClipboardMessage":
            MessageLookupByLibrary.simpleMessage("Link copied to clipboard."),
        "community_deleteFriendsButton":
            MessageLookupByLibrary.simpleMessage("Delete Friend"),
        "community_errorNoUser": MessageLookupByLibrary.simpleMessage(
            "Oops! We could not find the friend you were looking for."),
        "community_errorNotLoggedIn": MessageLookupByLibrary.simpleMessage(
            "Oops! You must be logged in to add a friend."),
        "community_friendsCardsTitle":
            MessageLookupByLibrary.simpleMessage("Friends"),
        "community_linkHeader": MessageLookupByLibrary.simpleMessage(
            "Add friends by sharing your personal link."),
        "community_loggedOutText1": MessageLookupByLibrary.simpleMessage(
            "This feature is only available if you are logged in."),
        "community_loggedOutText2":
            MessageLookupByLibrary.simpleMessage("Much sorry \nso wow!"),
        "community_shareEmbeddedSocialMediaDescription":
            MessageLookupByLibrary.simpleMessage(
                "Share this link with your friends to see their meditation stats."),
        "community_shareEmbeddedSocialMediaTitle":
            MessageLookupByLibrary.simpleMessage(
                "Ez Meditation - Community Feature"),
        "communnity_disconnectDialogButton":
            MessageLookupByLibrary.simpleMessage("Disconnect"),
        "communnity_disconnectDialogMessage": MessageLookupByLibrary.simpleMessage(
            "You will not be able to view your friends\' progress, and they won\'t be able to view yours."),
        "communnity_disconnectDialogTitle":
            MessageLookupByLibrary.simpleMessage("Disconnect from community?"),
        "daysCount": m0,
        "editProfile_appBarTitle": MessageLookupByLibrary.simpleMessage("Edit"),
        "email_notValidWarning": MessageLookupByLibrary.simpleMessage(
            "Please check your email address"),
        "feedback_dialogEmailLabel":
            MessageLookupByLibrary.simpleMessage("Your email (optional)"),
        "feedback_dialogFeedbackLabel":
            MessageLookupByLibrary.simpleMessage("Your feedback"),
        "feedback_dialogPrimaryButton":
            MessageLookupByLibrary.simpleMessage("Send"),
        "feedback_dialogTitle":
            MessageLookupByLibrary.simpleMessage("Send feedback"),
        "feedback_submitMessageSnackbar":
            MessageLookupByLibrary.simpleMessage("Thanks for your feedback!"),
        "finish_discardDialogButton":
            MessageLookupByLibrary.simpleMessage("Discard"),
        "finish_discardDialogMessage": MessageLookupByLibrary.simpleMessage(
            "This session will not be added to your progress data."),
        "finish_discardDialogTitle":
            MessageLookupByLibrary.simpleMessage("Discard session?"),
        "finish_discardSession":
            MessageLookupByLibrary.simpleMessage("Discard Session"),
        "finish_meditationDurationTitle":
            MessageLookupByLibrary.simpleMessage("You meditated for"),
        "finish_successMessage":
            MessageLookupByLibrary.simpleMessage("Well done!"),
        "globalErrorNoticeAuthenticateFailed":
            MessageLookupByLibrary.simpleMessage("Authentication failed!"),
        "globalErrorNoticeInvalidPassword":
            MessageLookupByLibrary.simpleMessage("incorrect password."),
        "globalErrorNoticeNetworkProblem": MessageLookupByLibrary.simpleMessage(
            "failed to connect to our server, please try again in few minutes."),
        "globalErrorNoticePrefix":
            MessageLookupByLibrary.simpleMessage("Something happened!"),
        "globalErrorNoticeTooManyAttempt": MessageLookupByLibrary.simpleMessage(
            "too many failed login attempt please try again later."),
        "globalErrorNoticeUserNotFound": MessageLookupByLibrary.simpleMessage(
            "no user found. The user may have been deleted."),
        "globalNotificationLogoutTitle": MessageLookupByLibrary.simpleMessage(
            "You have logged out successfully"),
        "globalNotificationNoticeDeleteSuccessfulDescription":
            MessageLookupByLibrary.simpleMessage(
                "you can comeback anytime you want, we will waiting"),
        "globalNotificationNoticeDeleteSuccessfulTitle":
            MessageLookupByLibrary.simpleMessage("we will miss you!"),
        "global_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "global_confirmPasswordHint":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "global_edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "global_email": MessageLookupByLibrary.simpleMessage("Email"),
        "global_emailHint":
            MessageLookupByLibrary.simpleMessage("Enter email address"),
        "global_info": MessageLookupByLibrary.simpleMessage("Info"),
        "global_login": MessageLookupByLibrary.simpleMessage("Login"),
        "global_logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "global_password": MessageLookupByLibrary.simpleMessage("Password"),
        "global_passwordHint":
            MessageLookupByLibrary.simpleMessage("Enter Password"),
        "global_success": MessageLookupByLibrary.simpleMessage("Success"),
        "global_username": MessageLookupByLibrary.simpleMessage("Username"),
        "global_usernameHint":
            MessageLookupByLibrary.simpleMessage("Enter username"),
        "global_warningFieldRequired":
            MessageLookupByLibrary.simpleMessage("* Field required"),
        "globel_register": MessageLookupByLibrary.simpleMessage("Register"),
        "login_appBarTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "logout_successMessage": MessageLookupByLibrary.simpleMessage(
            "You have logged out successfully."),
        "minutesCount": m1,
        "password_doNotMatchWarning":
            MessageLookupByLibrary.simpleMessage("Passwords do not match"),
        "password_minLengthWarning":
            MessageLookupByLibrary.simpleMessage("Min. 6 characters"),
        "profile_appBarTitle": MessageLookupByLibrary.simpleMessage("Profile"),
        "profile_calloutPlaceholder":
            MessageLookupByLibrary.simpleMessage("Codename"),
        "profile_communityTabTitle":
            MessageLookupByLibrary.simpleMessage("Community"),
        "profile_profileTabTitle":
            MessageLookupByLibrary.simpleMessage("My Profile"),
        "profile_sessionLogButton":
            MessageLookupByLibrary.simpleMessage("Session Log"),
        "profile_subtitlePlaceholder":
            MessageLookupByLibrary.simpleMessage("Codename"),
        "profile_usernamePlaceholder":
            MessageLookupByLibrary.simpleMessage("Username"),
        "progressView_progressTitle":
            MessageLookupByLibrary.simpleMessage("Progress"),
        "progress_averageSession":
            MessageLookupByLibrary.simpleMessage("Average session"),
        "progress_currentStreak":
            MessageLookupByLibrary.simpleMessage("Current streak"),
        "progress_maxStreak":
            MessageLookupByLibrary.simpleMessage("Max streak"),
        "progress_totalSessions":
            MessageLookupByLibrary.simpleMessage("Total sessions"),
        "registration_appBarTitle":
            MessageLookupByLibrary.simpleMessage("Registration"),
        "sessionLog_appBarTitle":
            MessageLookupByLibrary.simpleMessage("Session Log"),
        "sessionLog_entryTypeSessionLog":
            MessageLookupByLibrary.simpleMessage("Logged manually"),
        "sessionLog_entryTypeTimer":
            MessageLookupByLibrary.simpleMessage("EZ Timer"),
        "settings_appBarTitle":
            MessageLookupByLibrary.simpleMessage("Settings"),
        "settings_feedback": MessageLookupByLibrary.simpleMessage("Feedback"),
        "settings_notifications":
            MessageLookupByLibrary.simpleMessage("Notifications"),
        "settings_otherApps":
            MessageLookupByLibrary.simpleMessage("Other apps"),
        "settings_rate": MessageLookupByLibrary.simpleMessage("Rate"),
        "settings_resetProgressButtonTitle":
            MessageLookupByLibrary.simpleMessage("Reset"),
        "settings_resetProgressDataDialogMessage":
            MessageLookupByLibrary.simpleMessage(
                "All of your data will be reset to 0."),
        "settings_resetProgressDataDialogTitle":
            MessageLookupByLibrary.simpleMessage("Reset progress data?"),
        "settings_screenOnWhileMeditating":
            MessageLookupByLibrary.simpleMessage("Screen on while meditating"),
        "settings_termsConditions":
            MessageLookupByLibrary.simpleMessage("Terms & Conditions"),
        "settings_tileDisconnectFromCommunity":
            MessageLookupByLibrary.simpleMessage("Disconnect from community"),
        "settings_tileResetProgressData":
            MessageLookupByLibrary.simpleMessage("Reset progress data"),
        "snackbar_minSessionLengthInfo": MessageLookupByLibrary.simpleMessage(
            "Minimum timer length is 1 min."),
        "snackbar_success": MessageLookupByLibrary.simpleMessage("Yay!"),
        "sound_appBarTitle": MessageLookupByLibrary.simpleMessage("Sound"),
        "sound_noSound": MessageLookupByLibrary.simpleMessage("No sound"),
        "sounds_noSound": MessageLookupByLibrary.simpleMessage("No sound"),
        "timer_startButtonTitle": MessageLookupByLibrary.simpleMessage("Start")
      };
}
