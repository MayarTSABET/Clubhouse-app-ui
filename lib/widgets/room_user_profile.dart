import 'package:clubhouse/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user_profile_image.dart';

class RoomUserProfile extends StatelessWidget {
  final String photoUrl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile(
      {super.key,
      required this.photoUrl,
      required this.name,
      this.size = 42,
      this.isNew = false,
      this.isMuted = false,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0), //we will change
              child:
                  UserProfileImage(imageUrl: photoUrl, size: size),
            ),
            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4),
                      ]),
                  child: Icon(
                    Icons.celebration,
                    size: 20,
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4),
                      ]),
                  child: Icon(
                    Icons.mic_off,
                    size: 20,
                  ),
                ),
              ),
          ],
        ),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
