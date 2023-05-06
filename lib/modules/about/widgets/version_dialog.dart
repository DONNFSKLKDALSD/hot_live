import 'package:pure_live/common/index.dart';
import 'package:url_launcher/url_launcher.dart';

class NoNewVersionDialog extends StatelessWidget {
  const NoNewVersionDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).check_update),
      content: Text(S.of(context).no_new_version_info),
      actions: <Widget>[
        TextButton(
          child: Text(S.of(context).confirm),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class NewVersionDialog extends StatelessWidget {
  const NewVersionDialog({Key? key, this.entry}) : super(key: key);

  final OverlayEntry? entry;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).check_update),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(S.of(context).new_version_info(VersionUtil.latestVersion)),
          const SizedBox(height: 20),
          Text(
            VersionUtil.latestUpdateLog,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              if (entry != null) {
                entry!.remove();
              } else {
                Navigator.pop(context);
              }
              launchUrl(
                Uri.parse('https://wwrg.lanzouy.com/b047m4fyh'),
                mode: LaunchMode.externalApplication,
              );
            },
            child: const Text('国内下载：蓝奏云（3344）'),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(S.of(context).cancel),
          onPressed: () {
            if (entry != null) {
              entry!.remove();
            } else {
              Navigator.pop(context);
            }
          },
        ),
        ElevatedButton(
          child: Text(S.of(context).update),
          onPressed: () {
            if (entry != null) {
              entry!.remove();
            } else {
              Navigator.pop(context);
            }
            launchUrl(
              Uri.parse('https://github.com/Jackiu1997/pure_live/releases'),
              mode: LaunchMode.externalApplication,
            );
          },
        ),
      ],
    );
  }
}
