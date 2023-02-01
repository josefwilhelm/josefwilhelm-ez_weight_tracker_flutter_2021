import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class ProfileImageWidget extends StatelessWidget {
  final String? photoUrl;
  final double? radius;

  const ProfileImageWidget({
    Key? key,
    this.photoUrl,
    this.radius = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: turkish.withOpacity(0.5),
      foregroundImage:
          photoUrl != null ? CachedNetworkImageProvider(photoUrl ?? '') : null,
      radius: radius,
      child: photoUrl != null
          ? Container()
          : Icon(SFSymbols.person_fill, size: 38, color: Colors.white),
    );
  }
}
