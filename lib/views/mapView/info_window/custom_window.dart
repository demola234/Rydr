import 'package:flutter/material.dart';
import 'package:rydr/models/info_windows.dart';
import 'package:rydr/utils/colors.dart';

class CustomWindow extends StatelessWidget {
  const CustomWindow({Key? key, required this.info}) : super(key: key);
  final RideInfoWindow info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: ColorPath.Primarywhite,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, spreadRadius: 2, blurRadius: 5),
                ],
              ),
              width: double.infinity,
              height: double.infinity,
              child: Container(
                child: Row(
                  children: [
                    if (info.type == InfoWindowType.position)
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        color: Colors.black,
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${(info.time!.inMinutes) % 60}',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: ColorPath.Primarywhite)),
                            Text('min',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(color: ColorPath.Primarywhite)),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                          child: Text(
                        '${info.name}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.black),
                      )),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.black),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
