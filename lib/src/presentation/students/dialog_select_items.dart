// ignore_for_file: must_be_immutable

// import '../../splash/splash.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/constanst/constants.dart';

class DialogSelectItems extends StatefulWidget {
  DialogSelectItems({required this.listItem, this.indexPage});

  final List<String> listItem;
  final int? indexPage;

  @override
  State<DialogSelectItems> createState() => _DialogSelectItemsState();
}

class _DialogSelectItemsState extends State<DialogSelectItems> {
  late int? selectIndexPage = widget.indexPage;

  setIndexSelectPage(int index) {
    selectIndexPage = index;
  }

  back() {
    Get.back(result: selectIndexPage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30, top: 48),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            children: <Widget>[
              buildText(-1, "Tất cả", () {
                setIndexSelectPage(-1);
                setState(() {});
              })
            ] + List.generate(
              widget.listItem.length,
              (index) => buildText(index, widget.listItem[index].tr, () {
                setIndexSelectPage(index);
                setState(() {});
              }),
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Divider(color: Color(0xffE8EBEE), thickness: 1, height: 0),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => back(),
                child: Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text('Chọn',
                        style: AppTextStyles.normalBold
                            .copyWith(fontSize: 16)
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildText(int? index, String text, VoidCallback ontap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: ontap,
      child: Container(
        width: Get.width,
        color: selectIndexPage == index ? Colors.grey.withOpacity(0.6) : null,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            text.tr,
            style: selectIndexPage == index
                ? AppTextStyles.normalBold
                    .copyWith(fontSize: 20, color: Color(0xff333333))
                : AppTextStyles.normalBold.copyWith(
                    fontSize: 20, color: Colors.grey.withOpacity(0.3)),
          ),
        ),
      ),
    );
  }
}
