import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nnz/src/config/config.dart';
import 'package:nnz/src/controller/search_controller.dart';

class ShowSearchBar extends StatefulWidget {
  const ShowSearchBar({Key? key}) : super(key: key);

  @override
  State<ShowSearchBar> createState() => _ShowSearchBarState();
}

class _ShowSearchBarState extends State<ShowSearchBar> {
  final controller = Get.put(ShowSearchController());
  final logger = Logger();
  final List<String> _selectList = ['공연', '나눔'];
  String _selectItem = '공연';
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Config.blackColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                  value: _selectItem,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: Container(),
                  items: _selectList.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Center(
                        child: Text(item),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectItem = value!;
                    });
                  }),
              Expanded(
                child: TextField(
                  controller: controller.searchController,
                  onChanged: (text) {
                    logger.i(_selectItem);
                    controller.onChangeCategory(text: text, type: _selectItem);
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "찾고 있는 공연이 있으신가요?",
                    suffixIcon: Icon(
                      Icons.search_rounded,
                      color: Color(0xff898787),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
