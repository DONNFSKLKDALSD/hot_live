import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:pure_live/common/index.dart';
import 'package:pure_live/routes/app_pages.dart';

// ignore: must_be_immutable
class RoomCard extends StatelessWidget {
  const RoomCard({
    Key? key,
    required this.room,
    this.dense = false,
  }) : super(key: key);

  final LiveRoom room;
  final bool dense;

  void onTap(BuildContext context) async {
    AppPages.toLivePlay(room);
  }

  void onLongPress(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text(room.title),
        content: Text(
          S.of(context).room_info_content(
                room.roomId,
                room.platform,
                room.nick,
                room.title,
                room.liveStatus.name,
              ),
        ),
        actions: [FollowButton(room: room)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(7.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () => onTap(context),
        onLongPress: () => onLongPress(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Hero(
                  tag: room.roomId,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      color: Theme.of(context).focusColor,
                      elevation: 0,
                      child: room.liveStatus.name == 'live'
                          ? CachedNetworkImage(
                              imageUrl: room.cover,
                              fit: BoxFit.fill,
                              errorWidget: (context, error, stackTrace) =>
                                  Center(
                                child: Icon(
                                  Icons.live_tv_rounded,
                                  size: dense ? 30 : 48,
                                ),
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.tv_off_rounded,
                                    size: dense ? 38 : 48,
                                  ),
                                  Text(
                                    S.of(context).offline,
                                    style: TextStyle(
                                      fontSize: dense ? 18 : 26,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
                if (room.liveStatus == LiveStatus.live &&
                    room.watching.isNotEmpty)
                  Positioned(
                    right: dense ? 1 : 4,
                    bottom: dense ? 1 : 4,
                    child: CountChip(
                      icon: Icons.whatshot_rounded,
                      count: readableCount(room.watching),
                      dense: dense,
                    ),
                  ),
              ],
            ),
            ListTile(
              dense: dense,
              minLeadingWidth: dense ? 34 : null,
              contentPadding:
                  dense ? const EdgeInsets.only(left: 8, right: 10) : null,
              horizontalTitleGap: dense ? 8 : null,
              leading: CircleAvatar(
                foregroundImage: room.avatar.isNotEmpty
                    ? CachedNetworkImageProvider(room.avatar)
                    : null,
                radius: dense ? 17 : null,
                backgroundColor: Theme.of(context).disabledColor,
              ),
              title: Text(
                room.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: dense ? 12.5 : 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                room.nick,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: dense ? 12 : 14,
                ),
              ),
              trailing: dense
                  ? null
                  : Text(
                      room.platform.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class FollowButton extends StatefulWidget {
  const FollowButton({
    Key? key,
    required this.room,
  }) : super(key: key);

  final LiveRoom room;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  final settings = Get.find<SettingsService>();

  late bool isFavorite = settings.isFavorite(widget.room);

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        setState(() => isFavorite = !isFavorite);
        if (isFavorite) {
          settings.addRoom(widget.room);
        } else {
          settings.removeRoom(widget.room);
        }
      },
      style: ElevatedButton.styleFrom(),
      child: Text(isFavorite ? S.of(context).unfollow : S.of(context).follow),
    );
  }
}

class CountChip extends StatelessWidget {
  const CountChip({
    Key? key,
    required this.icon,
    required this.count,
    this.dense = false,
  }) : super(key: key);

  final IconData icon;
  final String count;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const StadiumBorder(),
      color: Colors.black.withOpacity(0.4),
      shadowColor: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(dense ? 4 : 6),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white.withOpacity(0.8),
              size: dense ? 13 : 16,
            ),
            const SizedBox(width: 4),
            Text(
              count,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: dense ? 10 : null,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
