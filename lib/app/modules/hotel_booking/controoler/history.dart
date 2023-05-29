import 'package:flextrip/app/controllers/user_info_controller.dart';
import 'package:flextrip/app/models/history_booking.dart';
import 'package:flextrip/utils/app_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  RxList<HistoryBookingModel> listHistoryTransaction = <HistoryBookingModel>[].obs;

  RxBool isLoading = false.obs;

  Future<void> getHistoryTransaction() async {
    try {
      isLoading(true);

      final collectionTransaction =
          FirebaseFirestore.instance.collection('booking_transaction');

      final result = await collectionTransaction.get();

      await Future.delayed(const Duration(seconds: 2));

      if (result.docs.isNotEmpty) {
        final document = result.docs.where(
          (element) =>
              element.data()['user_id'] == cUserInfo.dataUser.value.userId,
        );

        listHistoryTransaction(
          RxList.from(document.map((e) => HistoryBookingModel.fromJson(e.data()))),
        );

        listHistoryTransaction.sort(
          (a, b) => b.transactionDate.compareTo(a.transactionDate),
        );
      }

      isLoading(false);
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
    }
  }
}
