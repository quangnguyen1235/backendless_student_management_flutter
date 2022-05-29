import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/students/dialog_select_items.dart';
import 'package:flutter_app/src/resource/database/dao/dao.dart';
import 'package:flutter_app/src/resource/model/model.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class StudentsViewModel extends BaseViewModel {

  /// Danh sách sinh viên
  List<StudentModel> data = [];

  /// Danh sách ngành
  List<MajorModel> majors = [];

  /// Danh sách lớp
  List<ClassModel> classSubjects = [];

  /// Ngành được chọn để lọc ra sinh viên
  MajorModel? selectMajor;

  /// Lớp được chọn để lọc ra sinh viên
  ClassModel? selectClassSubject;

  /// Hàm được gọi đầu tiên:
  ///   - Lấy ra danh sách sinh viên ban đầu.
  ///   - Lấy danh sách các ngành.
  ///   - Lấy danh sách lớp.
  ///
  init() async {
    /// Bắn tín hiệu để màn hình chuyển sang trạng thái loading.
    setLoading(true);
    data = await getStudent();
    majors = await getMajor();
    classSubjects = await getClassSubject();

    /// Bắn tín hiệu để màn hình chuyển sang trạng thái dừng loading.
    setLoading(false);

    /// Bắn tín hiệu để cập nhật màn hình khi các thộc tính thay đổi.
    notifyListeners();
  }

  /// Hàm gọi để lấy danh sách sinh viên từ Backendless.
  Future<List<StudentModel>> getStudent() async {
    final DataQueryBuilder dataQueryBuilder = DataQueryBuilder();

    /// Dùng để truyển lên cho server để server trả ra những object Ngành, Đối tượng, Dân tộc, Lớp, Tỉnh vào Object SinhVien.
    dataQueryBuilder.related = [
      'MaNganh',
      'MaDoiTuong',
      'MaDanToc',
      'MaLop',
      'MaTinh',
    ];

    /// Nếu selectMajor khác null thì sẽ query theo mã ngành, nếu không phải thì sẽ là "1=1"(true).
    String majorClause = selectMajor != null ? "MaNganh.MaNganh = '${selectMajor!.majorCode}'" : "1=1";

    /// Nếu selectClassSubject khác null thì sẽ query theo mã lớp, nếu không phải thì sẽ là "1=1"(true).
    String classClause = selectClassSubject != null ? "MaLop.MaLop = '${selectClassSubject!.classCode}'" : "1=1";

    /// Tổng hợp 2 điều kiện query theo mã ngành hoặc lớp;
    dataQueryBuilder.whereClause = "$majorClause AND $classClause";

    final _ = await StudentDao().read(queryBuilder: dataQueryBuilder);
    return _;
  }

  /// Hàm gọi để lấy danh sách ngành từ Backendless.
  Future<List<MajorModel>> getMajor() async {
    return await MajorDao().read();
  }

  /// Hàm gọi để lấy danh sách lớp từ Backendless.
  Future<List<ClassModel>> getClassSubject() async {
    final DataQueryBuilder dataQueryBuilder = DataQueryBuilder();
    dataQueryBuilder.related = [
      'MaNganh',
    ];
    return await ClassDao().read(queryBuilder: dataQueryBuilder);
  }

  /// Hàm chọn ngành để tìm kiếm.
  onSelectMajor() async {

    /// Hiển thị bottomSheet (Hộp thoại ở dưới màn hình)
    ///
    /// index == null: Không cập nhật ngành
    /// index == -1: Chọn tất cả các ngành => Ngành được chọn bằng null
    /// index != -1: Vị trí của ngành được chọn trong danh sách majors
    final index = await bottomSheet(
      DialogSelectItems(
        listItem: majors.map((e) => e.majorName!).toList(),
        indexPage: selectMajor != null ? majors.indexOf(selectMajor!) : -1,
      ),
    );
    if (index != null) {

      /// index == -1 chọn tất cả các ngành - ngành được chọn là null
      if (index == -1) selectMajor = null;
      else{

        /// Gán lại selectMajor
        selectMajor = majors[index];

        /// Kiểm tra xem mã ngành được chọn có khác mã ngành trong lớp đã chọn hay không.
        /// Nếu có thì gán lớp được chọn lại bằng null
        ///
        /// Ví dụ:
        ///   - Lớp đang được chọn là Hoa_A của ngành HOA
        ///   - Ngành được chọn mới là CNTT
        ///   - Thì lớp sẽ bằng null
        if(selectMajor?.majorCode != selectClassSubject?.major?.majorCode){
          selectClassSubject = null;
        }
      }
      notifyListeners();
    }
  }

  /// Hàm chọn lớp để tìm kiếm.
  onSelectClassSubject() async {

    /// Tạo một danh sách lớp theo mã ngành.
    final temp = classSubjects.where((e) => selectMajor?.majorCode != null ? e.major?.majorCode == selectMajor?.majorCode : true).toList();

    /// Hiển thị bottomSheet (Hộp thoại ở dưới màn hình)
    ///
    /// index == null: Không cập nhật lớp
    /// index == -1: Chọn tất cả các lớp => Lớp đươc chọn bằng null
    /// index != -1: Vị trí của lớp được chọn trong danh sách classSubjects
    final index = await bottomSheet(
      DialogSelectItems(
        listItem: temp.map((e) => e.className!).toList(),
        indexPage: selectClassSubject != null ? classSubjects.indexOf(selectClassSubject!) : -1,
      ),
    );
    if (index != null) {
      /// index == -1 chọn tất cả các lớp - lớp được chọn là null
      if (index == -1) selectClassSubject = null;

      /// Gán lại selectClassSubject
      else selectClassSubject = temp[index];
      notifyListeners();
    }
  }

  /// Hàm submit được gọi khi bấm vào nút tìm kiếm
  /// Tiến hành gán lại data theo lớp và ngành(nếu có).
  onSubmitSearch() async {
    setLoading(true);
    data = await getStudent();
    notifyListeners();
    setLoading(false);
  }
}
