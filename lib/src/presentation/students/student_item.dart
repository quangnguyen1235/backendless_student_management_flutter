import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/students/student_detail.dart';
import 'package:flutter_app/src/resource/model/model.dart';
import 'package:get/get.dart';

class StudentItem extends StatelessWidget {
  final StudentModel studentModel;
  const StudentItem({Key? key, required this.studentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(StudentDetail(studentModel: studentModel),),
      child: PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(studentModel.name!, style: AppTextStyles.normalBold.copyWith(color: Colors.black),),
              const Spacer(),
              Text(studentModel.studentCode!, style: AppTextStyles.normal.copyWith(color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}
