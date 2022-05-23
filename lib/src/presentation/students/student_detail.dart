import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/utils/app_utils.dart';
import 'package:get/get.dart';

import '../../resource/resource.dart';

class StudentDetail extends StatelessWidget {
  final StudentModel studentModel;
  const StudentDetail({Key? key, required this.studentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Thông tin sinh viên"),
        backgroundColor: Colors.blue,
        leading: Center(
          child: InkWell(
            onTap: () => Get.back(),
            child: const Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("Trở về"),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildField(
                'Họ và tên',
                studentModel.name!,
              ),
              buildField(
                'Mã sinh viên',
                studentModel.studentCode!,
              ),
              buildField(
                'Ngành',
                studentModel.major!.majorName!,
              ),
              buildField(
                'Lớp',
                studentModel.classSubject!.className!,
              ),
              buildField(
                'Dân tộc',
                studentModel.nation!.nationName!,
              ),
              buildField(
                'Đối tượng',
                studentModel.subject!.subName!,
              ),
              buildField(
                'Giới tính',
                studentModel.gender! == 1 ? "Nữ" : "Nam",
              ),
              buildField(
                'Sinh nhật',
                AppUtils.convertDateTime2String(studentModel.birthDay,
                    format: 'dd/MM/yyyy'),
              ),
              buildField(
                'Sinh tại',
                studentModel.placeOfBirth!,
              ),
              buildField(
                'Quê quán',
                studentModel.province!.provinceName!,
              ),
              buildField(
                'Sổ CMND',
                studentModel.identificationNumber!,
              ),
              buildField(
                'Cấp ngày',
                AppUtils.convertDateTime2String(
                  studentModel.identificationDate,
                  format: 'dd/MM/yyyy',
                ),
              ),
              buildField(
                'Cấp tại',
                studentModel.identificationPlace!,
              ),
              buildField(
                'Địa chỉ',
                studentModel.address!,
              ),
              buildField(
                'Họ tên bố',
                studentModel.fatherName!,
              ),
              buildField(
                'Nghề nghiệp của bố',
                studentModel.fatherJob ?? "Không có",
              ),
              buildField(
                'Họ tên mẹ',
                studentModel.motherName!,
              ),
              buildField(
                'Nghề nghiệp của mẹ',
                studentModel.motherJob ?? "Không có",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildField(String title, String value) {
    return Column(
      children: [
        Wrap(
          children: [
            Text(
              title + ": ",
              style: AppTextStyles.normalBold.copyWith(color: Colors.black),
            ),
            Text(
              value,
              style: AppTextStyles.normal.copyWith(color: Colors.black),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
