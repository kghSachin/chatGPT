import 'package:chatgpttry/constants/constants.dart';
import 'package:chatgpttry/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../services/assets_manager.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.index});
  final String msg;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: index == 1 ? cardColor : scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(index == 0
                      ? AssetsManager.userprofile
                      : AssetsManager.botprofile),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextWidget(
                    label: msg,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                index == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.thumb_up_alt_outlined,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.thumb_down_alt_outlined,
                                color: Colors.white,
                              )),
                        ],
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
