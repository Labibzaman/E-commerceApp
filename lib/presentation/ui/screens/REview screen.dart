import 'package:crafty_bay/presentation/state_holders/reviewController.dart';
import 'package:crafty_bay/presentation/ui/screens/add_review_Screen.dart';
import 'package:crafty_bay/presentation/ui/utility/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
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
              replacement: CircularProgressIndicator(),
              visible: reviewController.inProgress==false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ReviewCard(
                          'User 1',
                          'Great product!');
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

class ReviewCard extends StatelessWidget {
  final String username;
  final String review;

  ReviewCard(this.username, this.review, {super.key});

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
                const CircleAvatar(),
                const SizedBox(width: 10),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              review,
              style: const TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
