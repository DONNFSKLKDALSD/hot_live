// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_CN';

  static String m0(name) => "${name}未开始直播.";

  static String m1(name) => "${name}轮播视频中.";

  static String m2(version) => "发现新版本: v${version}";

  static String m3(number) => "群号: ${number}";

  static String m4(roomid, platform, nickname, title, livestatus) =>
      "房间号: ${roomid}\n平台: ${platform}\n昵称: ${nickname}\n标题: ${title}\n状态: ${livestatus}";

  static String m5(time) => "${time} 分钟";

  static String m6(name) => "确定要取消关注${name}吗？";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("关于"),
        "app_legalese": MessageLookupByLibrary.simpleMessage(
            "本项目是一个纯本地直播转码应用，不会收集任何用户隐私，应用程序直接请求直播官方接口，所有操作生成的数据由用户本地保留。"),
        "app_name": MessageLookupByLibrary.simpleMessage("纯粹直播"),
        "areas_title": MessageLookupByLibrary.simpleMessage("分区"),
        "auto_backup": MessageLookupByLibrary.simpleMessage("自动备份"),
        "auto_refresh_time": MessageLookupByLibrary.simpleMessage("定时刷新时间"),
        "auto_refresh_time_subtitle":
            MessageLookupByLibrary.simpleMessage("定时刷新关注直播间状态"),
        "backup_directory": MessageLookupByLibrary.simpleMessage("备份目录"),
        "backup_recover": MessageLookupByLibrary.simpleMessage("备份与恢复"),
        "backup_recover_subtitle":
            MessageLookupByLibrary.simpleMessage("创建备份与恢复"),
        "bilibili_cookie":
            MessageLookupByLibrary.simpleMessage("Bilibili Cookie"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "change_language": MessageLookupByLibrary.simpleMessage("切换语言"),
        "change_language_subtitle":
            MessageLookupByLibrary.simpleMessage("切换软件的显示语言"),
        "change_theme_color": MessageLookupByLibrary.simpleMessage("主题颜色"),
        "change_theme_color_subtitle":
            MessageLookupByLibrary.simpleMessage("切换软件的主题颜色"),
        "change_theme_mode": MessageLookupByLibrary.simpleMessage("主题模式"),
        "change_theme_mode_subtitle":
            MessageLookupByLibrary.simpleMessage("切换系统/亮色/暗色模式"),
        "check_update": MessageLookupByLibrary.simpleMessage("检查更新"),
        "confirm": MessageLookupByLibrary.simpleMessage("确认"),
        "contact": MessageLookupByLibrary.simpleMessage("联系"),
        "create_backup": MessageLookupByLibrary.simpleMessage("创建备份"),
        "create_backup_failed": MessageLookupByLibrary.simpleMessage("创建备份失败"),
        "create_backup_subtitle":
            MessageLookupByLibrary.simpleMessage("可用于恢复当前数据"),
        "create_backup_success": MessageLookupByLibrary.simpleMessage("创建备份成功"),
        "custom": MessageLookupByLibrary.simpleMessage("定制"),
        "develop_progress": MessageLookupByLibrary.simpleMessage("开发进度"),
        "dlan_button_info": MessageLookupByLibrary.simpleMessage("DLNA投屏"),
        "dlan_device_not_found":
            MessageLookupByLibrary.simpleMessage("未发现DLNA设备"),
        "dlan_title": MessageLookupByLibrary.simpleMessage("DLNA投屏"),
        "email": MessageLookupByLibrary.simpleMessage("邮件"),
        "empty_areas_room_subtitle":
            MessageLookupByLibrary.simpleMessage("下滑/上滑刷新数据"),
        "empty_areas_room_title": MessageLookupByLibrary.simpleMessage("未发现直播"),
        "empty_areas_subtitle":
            MessageLookupByLibrary.simpleMessage("请点击下方按钮切换平台"),
        "empty_areas_title": MessageLookupByLibrary.simpleMessage("未发现分区"),
        "empty_favorite_offline_subtitle":
            MessageLookupByLibrary.simpleMessage("请先关注其他直播间"),
        "empty_favorite_offline_title":
            MessageLookupByLibrary.simpleMessage("无未开播直播间"),
        "empty_favorite_online_subtitle":
            MessageLookupByLibrary.simpleMessage("请先关注其他直播间"),
        "empty_favorite_online_title":
            MessageLookupByLibrary.simpleMessage("无已开播直播间"),
        "empty_favorite_subtitle":
            MessageLookupByLibrary.simpleMessage("请先关注其他直播间"),
        "empty_favorite_title": MessageLookupByLibrary.simpleMessage("无关注直播"),
        "empty_history": MessageLookupByLibrary.simpleMessage("无观看历史记录"),
        "empty_live_subtitle":
            MessageLookupByLibrary.simpleMessage("请点击下方按钮切换平台"),
        "empty_live_title": MessageLookupByLibrary.simpleMessage("未发现直播"),
        "empty_search_subtitle":
            MessageLookupByLibrary.simpleMessage("请输入其他关键字搜索"),
        "empty_search_title": MessageLookupByLibrary.simpleMessage("未发现直播"),
        "enable_auto_check_update":
            MessageLookupByLibrary.simpleMessage("自动检查更新"),
        "enable_auto_check_update_subtitle":
            MessageLookupByLibrary.simpleMessage("在每次进入软件时，自动检查更新"),
        "enable_background_play": MessageLookupByLibrary.simpleMessage("后台播放"),
        "enable_background_play_subtitle":
            MessageLookupByLibrary.simpleMessage("当暂时切出APP时，允许后台播放"),
        "enable_bilibili_search_cookie":
            MessageLookupByLibrary.simpleMessage("启用Bilibili搜索"),
        "enable_bilibili_search_cookie_subtitle":
            MessageLookupByLibrary.simpleMessage("设置Bilibili搜索所需Cookie"),
        "enable_dense_favorites_mode":
            MessageLookupByLibrary.simpleMessage("紧凑模式"),
        "enable_dense_favorites_mode_subtitle":
            MessageLookupByLibrary.simpleMessage("关注页面可显示更多直播间"),
        "enable_dynamic_color": MessageLookupByLibrary.simpleMessage("动态取色"),
        "enable_dynamic_color_subtitle":
            MessageLookupByLibrary.simpleMessage("启用Monet壁纸动态取色"),
        "enable_fullscreen_default":
            MessageLookupByLibrary.simpleMessage("自动全屏"),
        "enable_fullscreen_default_subtitle":
            MessageLookupByLibrary.simpleMessage("当进入直播播放页，自动进入全屏"),
        "enable_screen_keep_on": MessageLookupByLibrary.simpleMessage("屏幕常亮"),
        "enable_screen_keep_on_subtitle":
            MessageLookupByLibrary.simpleMessage("当处于直播播放页，屏幕保持常亮"),
        "experiment": MessageLookupByLibrary.simpleMessage("实验"),
        "favorites_title": MessageLookupByLibrary.simpleMessage("关注"),
        "float_overlay_ratio": MessageLookupByLibrary.simpleMessage("悬浮窗尺寸"),
        "float_overlay_ratio_subtitle":
            MessageLookupByLibrary.simpleMessage("视频小窗播放时，悬浮窗横向相对比例"),
        "float_window_play": MessageLookupByLibrary.simpleMessage("小窗播放"),
        "follow": MessageLookupByLibrary.simpleMessage("关注"),
        "followed": MessageLookupByLibrary.simpleMessage("已关注"),
        "general": MessageLookupByLibrary.simpleMessage("通用"),
        "github": MessageLookupByLibrary.simpleMessage("Github"),
        "help": MessageLookupByLibrary.simpleMessage("帮助"),
        "hide_offline_rooms": MessageLookupByLibrary.simpleMessage("隐藏未直播的直播间"),
        "history": MessageLookupByLibrary.simpleMessage("历史记录"),
        "info_is_offline": m0,
        "info_is_replay": m1,
        "issue_feedback": MessageLookupByLibrary.simpleMessage("问题反馈"),
        "license": MessageLookupByLibrary.simpleMessage("开源许可证"),
        "move_to_top": MessageLookupByLibrary.simpleMessage("移到顶部"),
        "new_version_info": m2,
        "no_new_version_info": MessageLookupByLibrary.simpleMessage("已在使用最新版本"),
        "offline": MessageLookupByLibrary.simpleMessage("未直播"),
        "offline_room_title": MessageLookupByLibrary.simpleMessage("未开播"),
        "online_room_title": MessageLookupByLibrary.simpleMessage("已开播"),
        "only_living": MessageLookupByLibrary.simpleMessage("只搜索直播中"),
        "play_video_failed": MessageLookupByLibrary.simpleMessage("无法播放直播"),
        "popular_title": MessageLookupByLibrary.simpleMessage("热门"),
        "prefer_platform": MessageLookupByLibrary.simpleMessage("首选直播平台"),
        "prefer_platform_subtitle":
            MessageLookupByLibrary.simpleMessage("当进入热门/分区，首选的直播平台"),
        "prefer_resolution": MessageLookupByLibrary.simpleMessage("首选清晰度"),
        "prefer_resolution_subtitle":
            MessageLookupByLibrary.simpleMessage("当进入直播播放页，首选的视频清晰度"),
        "project": MessageLookupByLibrary.simpleMessage("项目"),
        "project_alert": MessageLookupByLibrary.simpleMessage("项目声明"),
        "project_page": MessageLookupByLibrary.simpleMessage("项目主页"),
        "qq_group": MessageLookupByLibrary.simpleMessage("QQ群"),
        "qq_group_num": m3,
        "recover_backup": MessageLookupByLibrary.simpleMessage("恢复备份"),
        "recover_backup_failed": MessageLookupByLibrary.simpleMessage("恢复备份失败"),
        "recover_backup_subtitle":
            MessageLookupByLibrary.simpleMessage("从备份文件中恢复"),
        "recover_backup_success":
            MessageLookupByLibrary.simpleMessage("恢复备份成功，请重启"),
        "remove": MessageLookupByLibrary.simpleMessage("删除"),
        "replay": MessageLookupByLibrary.simpleMessage("录播"),
        "retry": MessageLookupByLibrary.simpleMessage("重试"),
        "room_info_content": m4,
        "search_input_hint": MessageLookupByLibrary.simpleMessage("输入直播关键字"),
        "select_recover_file": MessageLookupByLibrary.simpleMessage("选择备份文件"),
        "settings_danmaku_amount": MessageLookupByLibrary.simpleMessage("弹幕数量"),
        "settings_danmaku_area": MessageLookupByLibrary.simpleMessage("弹幕区域"),
        "settings_danmaku_fontBorder":
            MessageLookupByLibrary.simpleMessage("描边宽度"),
        "settings_danmaku_fontsize":
            MessageLookupByLibrary.simpleMessage("弹幕字号"),
        "settings_danmaku_opacity":
            MessageLookupByLibrary.simpleMessage("不透明度"),
        "settings_danmaku_speed": MessageLookupByLibrary.simpleMessage("弹幕速度"),
        "settings_danmaku_title": MessageLookupByLibrary.simpleMessage("弹幕设置"),
        "settings_timedclose_title":
            MessageLookupByLibrary.simpleMessage("定时关闭"),
        "settings_title": MessageLookupByLibrary.simpleMessage("设置"),
        "settings_videofit_title": MessageLookupByLibrary.simpleMessage("比例设置"),
        "show_offline_rooms": MessageLookupByLibrary.simpleMessage("显示未直播的直播间"),
        "support_donate": MessageLookupByLibrary.simpleMessage("捐赠支持"),
        "switch_platform": MessageLookupByLibrary.simpleMessage("切换直播平台"),
        "telegram": MessageLookupByLibrary.simpleMessage("Telegram"),
        "timedclose_time": m5,
        "unfollow": MessageLookupByLibrary.simpleMessage("取消关注"),
        "unfollow_message": m6,
        "update": MessageLookupByLibrary.simpleMessage("更新"),
        "version": MessageLookupByLibrary.simpleMessage("版本"),
        "video": MessageLookupByLibrary.simpleMessage("视频"),
        "videofit_contain": MessageLookupByLibrary.simpleMessage("默认比例"),
        "videofit_cover": MessageLookupByLibrary.simpleMessage("居中裁剪"),
        "videofit_fill": MessageLookupByLibrary.simpleMessage("填充屏幕"),
        "videofit_fitheight": MessageLookupByLibrary.simpleMessage("适应高度"),
        "videofit_fitwidth": MessageLookupByLibrary.simpleMessage("适应宽度"),
        "what_is_new": MessageLookupByLibrary.simpleMessage("最新特性")
      };
}
