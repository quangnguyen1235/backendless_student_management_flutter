import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/students/student_item.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  _StudentsScreenState createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  late StudentsViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseWidget<StudentsViewModel>(
        viewModel: StudentsViewModel(),
        onViewModelReady: (viewModel) {
          _viewModel = viewModel..init();
        },
        // child: WidgetBackground(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Danh sách sinh viên"),
              centerTitle: true,
            ),
            body: SafeArea(child: _buildBody()),
          );
        });
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: buildSelectField(
                  "Chọn mã ngành",
                  _viewModel.selectMajor?.majorName,
                  onTap: _viewModel.onSelectMajor,
                  isSelect: _viewModel.selectMajor != null,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: buildSelectField(
                  "Chọn mã lớp",
                  _viewModel.selectClassSubject?.className,
                  onTap: _viewModel.onSelectClassSubject,
                  isSelect: _viewModel.selectClassSubject != null,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: WidgetOutlinedButton(
              title: "Tìm kiếm",
              action: () => _viewModel.onSubmitSearch(),
              textStyle: AppTextStyles.normalBold
                  .copyWith(fontSize: 16, color: Colors.blue),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: buildListData(),
          )
        ],
      ),
    );
  }

  Widget buildListData() {
    return Container(
      child: _viewModel.data.isEmpty
          ? const Center(
              child: Text("Không có dữ liệu"),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                  _viewModel.data.length,
                  (index) => Column(
                    children: [
                      StudentItem(
                        studentModel: _viewModel.data[index],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget buildSelectField(String text, String? valueText,
      {bool isSelect = false, Function? onTap}) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap() : () => null,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: isSelect ? Colors.black : Colors.grey.withOpacity(0.3),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            isSelect ? valueText ?? '' : text,
            style: TextStyle(
              color: isSelect ? Colors.black : Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
