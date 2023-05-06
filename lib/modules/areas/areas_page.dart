import 'package:get/get.dart';
import 'package:pure_live/common/index.dart';

import 'areas_controller.dart';
import 'areas_grid_view.dart';

class AreasPage extends GetView<AreasController> {
  const AreasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      bool showAction = constraint.maxWidth <= 480;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          leading: showAction ? const MenuButton() : null,
          actions: showAction ? [const SearchButton()] : null,
          title: TabBar(
            controller: controller.tabController,
            isScrollable: true,
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            labelPadding: const EdgeInsets.symmetric(horizontal: 12),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: Sites.supportSites.map((e) => Tab(text: e.name)).toList(),
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: Sites.supportSites
              .map((e) => AreaGridView(
                    labels: controller.data[e.id]?['labels'] ?? [],
                    areas: controller.data[e.id]?['areas'] ?? [],
                  ))
              .toList(),
        ),
      );
    });
  }
}
