import 'package:crafty_bay/presentation/state_holders/reviewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/CreateReview_controller.dart';

class AddNewReviewScreen extends StatefulWidget {
  const AddNewReviewScreen({super.key, required this.productId});

  final int productId;

  @override
  State<AddNewReviewScreen> createState() => _AddNewReviewScreenState();
}

class _AddNewReviewScreenState extends State<AddNewReviewScreen> {
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _descriptionController =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(45),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 16),
                TextFormField(
                  controller: _ratingController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      hintText: ' 80/100'),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter  rating';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Write your Review',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter Review description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child:
                      GetBuilder<CreateReviewController>(builder: (controller) {
                    return Visibility(
                      visible: controller.inProgress == false,
                      replacement:
                          const Center(child: CircularProgressIndicator()),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            final response = await controller.CreateReview(
                              widget.productId,
                              int.parse(_ratingController.text.trim()),
                              _descriptionController.text.trim(),
                            );
                            if (response) {
                              Get.back();
                              Get.find<ReviewController>()
                                  .getReview(widget.productId);
                            } else {
                              Get.showSnackbar(const GetSnackBar(
                                title: 'failed',
                                message: 'try again ',
                                duration: Duration(seconds: 2),
                                isDismissible: true,
                                backgroundColor: Colors.red,
                              ));
                            }
                          }
                        },
                        child: const Text('Submit',style: TextStyle(color: Colors.white),),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ratingController.clear();
    _descriptionController.clear();
    super.dispose();
  }
}
