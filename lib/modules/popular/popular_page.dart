import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure_live/core/sites.dart';
import 'package:pure_live/common/widgets/index.dart';
import 'package:pure_live/modules/popular/popular_controller.dart';

import 'popular_grid_view.dart';

class PopularPage extends GetView<PopularController> {
  const PopularPage({Key? key}) : super(key: key);

  bool get showAction => Get.size.width < 640;

  @override
  Widget build(BuildContext context) {
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
        children: Sites.supportSites.map((e) => PopularGridView(e.id)).toList(),
      ),
    );
  }
}
