import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pure_live/common/index.dart';

class HistoryPage extends GetView {
  HistoryPage({Key? key}) : super(key: key);

  final refreshController = RefreshController();

  Future onRefresh() async {
    bool result = true;
    final SettingsService settings = Get.find<SettingsService>();

    for (final room in settings.historyRooms) {
      try {
        var newRoom = await Sites.of(room.platform).liveSite.getRoomInfo(room);
        settings.updateRoomInHistory(newRoom);
      } catch (e) {
        result = false;
      }
    }

    if (result) {
      refreshController.refreshCompleted();
    } else {
      refreshController.refreshFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        title: Text('${S.of(context).history}(20)'),
      ),
      body: Obx(() {
        final SettingsService settings = Get.find<SettingsService>();
        const dense = true;
        final rooms = settings.historyRooms.reversed.toList();
        return LayoutBuilder(builder: (context, constraint) {
          final width = constraint.maxWidth;
          int crossAxisCount =
              width > 1280 ? 4 : (width > 960 ? 3 : (width > 640 ? 2 : 1));
          if (dense) {
            crossAxisCount =
                width > 1280 ? 5 : (width > 960 ? 4 : (width > 640 ? 3 : 2));
          }
          return SmartRefresher(
            enablePullDown: true,
            physics: const BouncingScrollPhysics(),
            header: const WaterDropHeader(),
            controller: refreshController,
            onRefresh: onRefresh,
            child: rooms.isEmpty
                ? EmptyView(
                    icon: Icons.history_rounded,
                    title: S.of(context).empty_history,
                    subtitle: '',
                  )
                : MasonryGridView.count(
                    padding: const EdgeInsets.all(5),
                    controller: ScrollController(),
                    crossAxisCount: crossAxisCount,
                    itemCount: rooms.length,
                    itemBuilder: (context, index) =>
                        RoomCard(room: rooms[index], dense: dense),
                  ),
          );
        });
      }),
    );
  }
}
