import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:pure_live/common/index.dart';
import 'package:pure_live/modules/live_play/live_play_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wakelock/wakelock.dart';

import 'widgets/index.dart';

// ignore: must_be_immutable
class LivePlayPage extends GetView<LivePlayController> {
  LivePlayPage({Key? key}) : super(key: key);

  final SettingsService settings = Get.find<SettingsService>();

  late double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    if (settings.enableScreenKeepOn.value) {
      Wakelock.toggle(enable: settings.enableScreenKeepOn.value);
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          CircleAvatar(
            foregroundImage: controller.room.avatar.isEmpty
                ? null
                : NetworkImage(controller.room.avatar),
            radius: 13,
            backgroundColor: Theme.of(context).disabledColor,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.room.nick,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                '${controller.room.platform.toUpperCase()} / ${controller.room.area}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 8),
              ),
            ],
          ),
        ]),
        actions: [
          IconButton(
            tooltip: S.of(context).dlan_button_info,
            onPressed: showDlnaCastDialog,
            icon: const Icon(CustomIcons.cast),
          ),
        ],
      ),
      body: SafeArea(
        child: ScreenTypeLayout.builder(
          mobile: (context) => buildMobileView(),
          tablet: (context) => buildTabletView(),
          desktop: (context) => buildTabletView(),
        ),
      ),
      floatingActionButton: FavoriteFloatingButton(room: controller.room),
    );
  }

  Widget buildMobileView() {
    return Column(
      children: <Widget>[
        buildVideoPlayer(width),
        const ResolutionsRow(),
        const Divider(height: 1),
        Expanded(
          child: DanmakuListView(
            key: controller.danmakuViewKey,
            room: controller.room,
          ),
        ),
      ],
    );
  }

  Widget buildTabletView() {
    return Row(children: <Widget>[
      Flexible(
        flex: 5,
        child: buildVideoPlayer(width / 8.0 * 5.0),
      ),
      Flexible(
        flex: 3,
        child: Column(children: [
          const ResolutionsRow(),
          const Divider(height: 1),
          Expanded(
            child: DanmakuListView(
              key: controller.danmakuViewKey,
              room: controller.room,
            ),
          ),
        ]),
      ),
    ]);
  }

  Widget buildVideoPlayer(double videoWidth) {
    return Hero(
      tag: controller.room.roomId,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.black,
          child: Obx(
            () => controller.success.value
                ? VideoPlayer(
                    key: controller.playerKey,
                    controller: controller.videoController!,
                  )
                : Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    clipBehavior: Clip.antiAlias,
                    color: Get.theme.focusColor,
                    child: CachedNetworkImage(
                      imageUrl: controller.room.cover,
                      fit: BoxFit.fill,
                      errorWidget: (context, error, stackTrace) => const Center(
                        child: Icon(Icons.live_tv_rounded, size: 48),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void showDlnaCastDialog() {
    Get.dialog(LiveDlnaPage(datasource: controller.selectedStreamUrl));
  }
}

class ResolutionsRow extends StatefulWidget {
  const ResolutionsRow({Key? key}) : super(key: key);

  @override
  State<ResolutionsRow> createState() => _ResolutionsRowState();
}

class _ResolutionsRowState extends State<ResolutionsRow> {
  LivePlayController get controller => Get.find();

  late String selectedRate = controller.selectedResolution;
  late String selectedStreamUrl = controller.selectedStreamUrl;

  Widget buildInfoCount() {
    // controller.room watching or followers
    Widget info = Container();
    if (controller.room.followers.isNotEmpty) {
      info = Row(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.person_rounded, size: 14),
        const SizedBox(width: 4),
        Text(
          readableCount(controller.room.followers),
          style: Get.textTheme.bodySmall,
        ),
      ]);
    } else if (controller.room.watching.isNotEmpty) {
      info = Row(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.whatshot_rounded, size: 14),
        const SizedBox(width: 4),
        Text(
          readableCount(controller.room.watching),
          style: Get.textTheme.bodySmall,
        ),
      ]);
    }
    return info;
  }

  List<Widget> buildResultionsList() {
    return controller.liveStream.keys
        .map<Widget>((rate) => PopupMenuButton(
              tooltip: rate,
              color: Get.theme.colorScheme.surfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              offset: const Offset(0.0, 5.0),
              position: PopupMenuPosition.under,
              icon: Text(
                rate,
                style: Get.theme.textTheme.labelSmall?.copyWith(
                  color: rate == selectedRate
                      ? Get.theme.colorScheme.primary
                      : null,
                ),
              ),
              onSelected: (String url) {
                controller.setResolution(rate, url);
                setState(() {
                  selectedRate = rate;
                  selectedStreamUrl = url;
                });
              },
              itemBuilder: (context) {
                final items = <PopupMenuItem<String>>[];
                final urls = controller.liveStream[rate]!;
                for (int i = 0; i < urls.length; i++) {
                  items.add(PopupMenuItem<String>(
                    value: urls[i],
                    child: Text(
                      '线路${i + 1}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: urls[i] == selectedStreamUrl
                                ? Get.theme.colorScheme.primary
                                : null,
                          ),
                    ),
                  ));
                }
                return items;
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 55,
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: buildInfoCount(),
            ),
            const Spacer(),
            ...controller.success.value ? buildResultionsList() : [],
          ],
        ),
      ),
    );
  }
}

class FavoriteFloatingButton extends StatefulWidget {
  const FavoriteFloatingButton({
    Key? key,
    required this.room,
  }) : super(key: key);

  final LiveRoom room;

  @override
  State<FavoriteFloatingButton> createState() => _FavoriteFloatingButtonState();
}

class _FavoriteFloatingButtonState extends State<FavoriteFloatingButton> {
  final settings = Get.find<SettingsService>();

  late bool isFavorite = settings.isFavorite(widget.room);

  @override
  Widget build(BuildContext context) {
    return isFavorite
        ? FloatingActionButton(
            elevation: 2,
            backgroundColor: Theme.of(context).cardColor,
            tooltip: S.of(context).unfollow,
            onPressed: () {
              setState(() => isFavorite = !isFavorite);
              settings.removeRoom(widget.room);
            },
            child: CircleAvatar(
              foregroundImage: (widget.room.avatar == '')
                  ? null
                  : NetworkImage(widget.room.avatar),
              radius: 18,
              backgroundColor: Theme.of(context).disabledColor,
            ),
          )
        : FloatingActionButton.extended(
            elevation: 2,
            backgroundColor: Theme.of(context).cardColor,
            onPressed: () {
              setState(() => isFavorite = !isFavorite);
              settings.addRoom(widget.room);
            },
            icon: CircleAvatar(
              foregroundImage: (widget.room.avatar == '')
                  ? null
                  : NetworkImage(widget.room.avatar),
              radius: 18,
              backgroundColor: Theme.of(context).disabledColor,
            ),
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).follow,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  widget.room.nick,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
  }
}
