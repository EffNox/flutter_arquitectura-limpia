import 'package:flutter/material.dart';

Future<void> showBottomSheetDialog(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    enableDrag: false,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () => Navigator.pop(context),
            leading: const Icon(Icons.photo_album_outlined),
            title: const Text('Photos'),
          ),
          ListTile(
            onTap: () => Navigator.pop(context),
            leading: const Icon(Icons.south_rounded),
            title: const Text('Musica'),
          ),
          ListTile(
            onTap: () => Navigator.pop(context),
            leading: const Icon(Icons.video_camera_back_outlined),
            title: const Text('Video'),
          ),
          // ElevatedButton(onPressed: () {}, child: const Text('Ok')),
        ],
      ),
    ),
  );
}
