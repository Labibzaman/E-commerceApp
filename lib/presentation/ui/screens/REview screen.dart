import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/reviewController.dart';
import 'package:crafty_bay/presentation/ui/screens/add_review_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../utility/appcolors.dart';
import '../widgets/reviewCardItem.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ReviewController>().getReview(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Reviews'),
      ),
      body: GetBuilder<ReviewController>(builder: (reviewcontroller) {
        if (reviewcontroller.inProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Visibility(
                  visible: reviewcontroller.reviews.data?.isNotEmpty ?? false,
                  replacement: const Center(
                    child: Text('Reviews Not Found'),
                  ),
                  child: ListView.builder(
                    itemCount: reviewcontroller.reviews.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ReviewsCard(
                        reviewData: reviewcontroller.reviews.data![index],
                      );
                    },
                  ),
                ),
              ),
            ),
            reviewSction(reviewcontroller.reviews.data?.length ?? 0),
          ],
        );
      }),
    );
  }

  Container reviewSction(int totalReviews) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Reviews (${totalReviews.toString()})',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 45,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              onPressed: () {
                if (Get.find<Auth_Controller>().isTokenNotNull == false) {
                  Auth_Controller.goToLogin();
                  return;
                }
                Get.to(() => AddNewReviewScreen(
                     productId: widget.productId,
                    ));
              },
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
