import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/utils/logger.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import 'community_service.dart';

class DynamicLinkService {
  final _logger = getLogger('DynamicLinkService');

  DynamicLinkService() {
    handleDynamicLinks();
  }

  Future handleDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
      final link = await FirebaseDynamicLinks.instance.getInitialLink();
      if (link?.link != null) {
        _handleDeepLink(dynamicLinkData);
      }
    });
  }

  void _handleDeepLink(PendingDynamicLinkData? data) {
    final deepLink = data?.link;
    if (deepLink != null) {
      _logger.i('_handleDeepLink | deeplink: $deepLink');

      var isCommunity = deepLink.pathSegments.contains('community');
      if (isCommunity) {
        var userId = deepLink.queryParameters['id'];

        if (userId != null) {
          getIt<CommunityService>().addCommunityUser(userId);
        }
      }
    }
  }

  Future<Uri> createDynamicLink(String userId) async {
    final parameters = DynamicLinkParameters(
      uriPrefix: 'https://ezmeditation.page.link',
      link: Uri.parse('https://digital-snacks.at/community?id=$userId'),
      androidParameters: AndroidParameters(
        packageName: 'at.digitalsnacks.meditation',
        minimumVersion: 0,
      ),
      iosParameters: IOSParameters(
        bundleId: 'at.digitalsnacks.meditation',
        appStoreId: '1570800384',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: S.current.community_shareEmbeddedSocialMediaTitle,
        description: S.current.community_shareEmbeddedSocialMediaDescription,
      ),
    );

    final shortLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    final dynamicUrl = shortLink.shortUrl;

    _logger.i(dynamicUrl);
    return dynamicUrl;
  }
}
