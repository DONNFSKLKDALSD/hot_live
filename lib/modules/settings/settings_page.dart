import 'package:get/get.dart';
import 'package:pure_live/common/index.dart';
import 'package:pure_live/modules/backup/backup_page.dart';

class SettingsPage extends GetView<SettingsService> {
  const SettingsPage({Key? key}) : super(key: key);

  BuildContext get context => Get.context!;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: screenWidth > 640 ? 0 : null,
        title: Text(S.of(context).settings_title),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          SectionTitle(title: S.of(context).general),
          ListTile(
            leading: const Icon(Icons.dark_mode_rounded, size: 32),
            title: Text(S.of(context).change_theme_mode),
            subtitle: Text(S.of(context).change_theme_mode_subtitle),
            onTap: showThemeModeSelectorDialog,
          ),
          ListTile(
            leading: const Icon(Icons.color_lens, size: 32),
            title: Text(S.of(context).change_theme_color),
            subtitle: Text(S.of(context).change_theme_color_subtitle),
            onTap: showThemeColorSelectorDialog,
          ),
          ListTile(
            leading: const Icon(Icons.translate_rounded, size: 32),
            title: Text(S.of(context).change_language),
            subtitle: Text(S.of(context).change_language_subtitle),
            onTap: showLanguageSelecterDialog,
          ),
          ListTile(
            leading: const Icon(Icons.backup_rounded, size: 32),
            title: Text(S.of(context).backup_recover),
            subtitle: Text(S.of(context).backup_recover_subtitle),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BackupPage()),
            ),
          ),
          SectionTitle(title: S.of(context).video),
          Obx(() => SwitchListTile(
                title: Text(S.of(context).enable_background_play),
                subtitle: Text(S.of(context).enable_background_play_subtitle),
                value: controller.enableBackgroundPlay.value,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (bool value) =>
                    controller.enableBackgroundPlay.value = value,
              )),
          Obx(() => SwitchListTile(
                title: Text(S.of(context).enable_screen_keep_on),
                subtitle: Text(S.of(context).enable_screen_keep_on_subtitle),
                value: controller.enableScreenKeepOn.value,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (bool value) =>
                    controller.enableScreenKeepOn.value = value,
              )),
          Obx(() => SwitchListTile(
                title: Text(S.of(context).enable_fullscreen_default),
                subtitle:
                    Text(S.of(context).enable_fullscreen_default_subtitle),
                value: controller.enableFullScreenDefault.value,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (bool value) =>
                    controller.enableFullScreenDefault.value = value,
              )),
          ListTile(
            title: Text(S.of(context).prefer_resolution),
            subtitle: Text(S.of(context).prefer_resolution_subtitle),
            onTap: showPreferResolutionSelectorDialog,
          ),
          SectionTitle(title: S.of(context).custom),
          Obx(() => SwitchListTile(
                title: Text(S.of(context).enable_dynamic_color),
                subtitle: Text(S.of(context).enable_dynamic_color_subtitle),
                value: controller.enableDynamicTheme.value,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (bool value) =>
                    controller.enableDynamicTheme.value = value,
              )),
          Obx(() => SwitchListTile(
                title: Text(S.of(context).enable_dense_favorites_mode),
                subtitle:
                    Text(S.of(context).enable_dense_favorites_mode_subtitle),
                value: controller.enableDenseFavorites.value,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (bool value) =>
                    controller.enableDenseFavorites.value = value,
              )),
          Obx(() => SwitchListTile(
                title: Text(S.of(context).enable_auto_check_update),
                subtitle: Text(S.of(context).enable_auto_check_update_subtitle),
                value: controller.enableAutoCheckUpdate.value,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (bool value) =>
                    controller.enableAutoCheckUpdate.value = value,
              )),
          ListTile(
            title: Text(S.of(context).prefer_platform),
            subtitle: Text(S.of(context).prefer_platform_subtitle),
            onTap: showPreferPlatformSelectorDialog,
          ),
          ListTile(
            title: Text(S.of(context).auto_refresh_time),
            subtitle: Text(S.of(context).auto_refresh_time_subtitle),
            trailing: Obx(() => Text('${controller.autoRefreshTime}s')),
            onTap: showAutoRefreshTimeSetDialog,
          ),
        ],
      ),
    );
  }

  void showThemeModeSelectorDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(S.of(Get.context!).change_theme_mode),
            children: SettingsService.themeModes.keys.map<Widget>((name) {
              return RadioListTile<String>(
                activeColor: Theme.of(context).colorScheme.primary,
                groupValue: controller.themeModeName.value,
                value: name,
                title: Text(name),
                onChanged: (value) {
                  controller.changeThemeMode(value!);
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          );
        });
  }

  void showThemeColorSelectorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(S.of(context).change_theme_color),
          children: SettingsService.themeColors.keys.map<Widget>((name) {
            final color = SettingsService.themeColors[name];
            return RadioListTile<String>(
              activeColor: Theme.of(context).colorScheme.primary,
              groupValue: controller.themeColorName.value,
              value: name,
              title: Text(name, style: TextStyle(color: color)),
              onChanged: (value) {
                controller.changeThemeColor(value!);
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        );
      },
    );
  }

  void showLanguageSelecterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(S.of(context).change_language),
          children: SettingsService.languages.keys.map<Widget>((name) {
            return RadioListTile<String>(
              activeColor: Theme.of(context).colorScheme.primary,
              groupValue: controller.languageName.value,
              value: name,
              title: Text(name),
              onChanged: (value) {
                controller.changeLanguage(value!);
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        );
      },
    );
  }

  void showPreferResolutionSelectorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(S.of(context).prefer_resolution),
          children: SettingsService.resolutions.map<Widget>((name) {
            return RadioListTile<String>(
              activeColor: Theme.of(context).colorScheme.primary,
              groupValue: controller.preferResolution.value,
              value: name,
              title: Text(name),
              onChanged: (value) {
                controller.changePreferResolution(value!);
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        );
      },
    );
  }

  void showPreferPlatformSelectorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(S.of(context).prefer_platform),
          children: SettingsService.platforms.map<Widget>((name) {
            return RadioListTile<String>(
              activeColor: Theme.of(context).colorScheme.primary,
              groupValue: controller.preferPlatform.value,
              value: name,
              title: Text(name.toUpperCase()),
              onChanged: (value) {
                controller.changePreferPlatform(value!);
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        );
      },
    );
  }

  void showAutoRefreshTimeSetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // title: Text(S.of(context).auto_refresh_time),
        content: Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  min: 10,
                  max: 120,
                  label: S.of(context).auto_refresh_time,
                  value: controller.autoRefreshTime.toDouble(),
                  onChanged: (value) =>
                      controller.autoRefreshTime.value = value.toInt(),
                ),
                Text('${S.of(context).auto_refresh_time}:'
                    ' ${controller.autoRefreshTime}s'),
              ],
            )),
      ),
    );
  }
}
