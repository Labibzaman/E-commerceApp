import 'package:crafty_bay/data/models/reviewList_data_model.dart';
import 'package:crafty_bay/presentation/state_holders/reviewController.dart';
import 'package:crafty_bay/presentation/ui/screens/add_review_Screen.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/reviewerProfile.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.productID});
final int productID;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ReviewController>().getReview(widget.productID);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

       Get.to( ()=> AddNewReviewscreen());
      },child: const Icon(CupertinoIcons.plus,color: AppColors.primaryColor,),),
      appBar: AppBar(
        title: const Text('Review Screen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ReviewController>(
          builder: (reviewController) {
            return Visibility(
              replacement: const Center(child: CircularProgressIndicator()),
              visible: reviewController.inProgress==false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: reviewController.reviews.data?.length??0,
                    itemBuilder: (BuildContext context, int index) {
                      return ReviewCard(reviewProfile: reviewController.reviews.data![index],
                          );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 0,
                      );
                    },

                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

class ReviewCard extends StatefulWidget {

  final ReviewListDataModel reviewProfile;

  ReviewCard({super.key, required this.reviewProfile, });

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(Icons.person_outline),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '${widget.reviewProfile.profile!.cusName}',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
             ' ${widget.reviewProfile.description}',
              style: const TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
