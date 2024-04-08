import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data.dart';
import '../models/room.dart';
import '../widgets/room_user_profile.dart';
import '../widgets/user_profile_image.dart';

class roomPage extends StatelessWidget {
  final Room room;

  const roomPage({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130,
        leading: TextButton.icon(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.expand_more,
            size: 35,
          ),
          label: Text(
            'Hallway',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.insert_drive_file,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: UserProfileImage(
                imageUrl: currentUser.photoUrl,
                size: 34.0,
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(25),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${room.club}'.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .overline!
                                .copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.0),
                          ),
                          Icon(
                            Icons.home,
                            size: 17,
                          ),
                        ],
                      ),
                      Icon(Icons.more_horiz),
                    ],
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 15.0,
                children: room.speakers.map((e) => RoomUserProfile(
                  photoUrl:e.photoUrl,
                  name:e.firstName,
                  size:66,
                  isNew:Random().nextBool(),
                  isMuted:Random().nextBool(),
                )).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Followed by Speakers',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 14.0,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 15.0,
                children: room.followedBySpeakers.map((e) => RoomUserProfile(
                  photoUrl:e.photoUrl,
                  name:e.firstName,
                  size:66,
                  isNew:Random().nextBool(),
                )).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Others in the room',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 14.0,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
                mainAxisSpacing: 15.0,
                children: room.others.map((e) => RoomUserProfile(
                  photoUrl:e.photoUrl,
                  name:e.firstName,
                  size:66,
                  isNew:Random().nextBool(),
                )).toList(),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 80),),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                '✌️ Leave quietly',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(12),
                backgroundColor: Colors.grey[100],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.add,
                  color: Colors.black,
                  size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.front_hand,
                  color: Colors.grey[300],
                  size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
        ],
        ),
      ),
    );
  }
}
