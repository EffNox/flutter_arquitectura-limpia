import 'package:flutter/material.dart';

Future<void> showCumtomDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const _CustomDialog();
    },
  );
}

class _CustomDialog extends StatelessWidget {
  const _CustomDialog();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, size: 35),
                ),
              ),
              const Text(
                'Congratulations',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15),
              const Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.greenAccent,
                size: 120,
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(25),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
