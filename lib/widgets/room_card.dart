import 'package:clubhouse/pages/room_page.dart';
import 'package:clubhouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/room.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({super.key, required this.room});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
      Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => roomPage(room: room),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${room.club}'.toUpperCase(),
                      style: Theme.of(context).textTheme
                      .overline!
                      .copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0,
                      ),
                    ),
                    Icon(
                      Icons.home,
                      size: 17,
                    ),
                  ],
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 15,
                              right: 10,
                              child: UserProfileImage(
                                  imageUrl: room.speakers[1].photoUrl, size: 48.0),
                            ),
                            Positioned(
                              left: 10.0,
                              top: 10.0,
                              child: UserProfileImage(
                                  imageUrl: room.speakers[0].photoUrl, size: 48.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) => Text(
                                  '${e.firstName} ${e.lastName} 💬',
                                  //style: Theme.of(context).textTheme.bodyLarge.copyWith(fontSize: 20.0,),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                              TextSpan(
                                  text:
                                      '${room.speakers.length + room.followedBySpeakers.length + room.others.length} '),
                              WidgetSpan(
                                child: Icon(
                                  Icons.person,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(text: ' / ${room.speakers.length} '),
                              WidgetSpan(
                                child: Icon(
                                  Icons.sms,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                            style: TextStyle(
                              color: Colors.grey
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
