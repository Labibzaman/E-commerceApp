import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/service/Network_Caller.dart';
import '../../../data/utility/URls.dart';

class AddNewReviewscreen extends StatefulWidget {
  AddNewReviewscreen({
    super.key,
  });

  @override
  State<AddNewReviewscreen> createState() => _AddNewReviewscreenState();
}

class _AddNewReviewscreenState extends State<AddNewReviewscreen> {
  final TextEditingController _titleTeController = TextEditingController();
  final TextEditingController _descripTeController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Review'),
      ),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 28,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        TextFormField(
                          controller: _titleTeController,
                          decoration:
                              const InputDecoration(hintText: 'First Name'),
                          validator: (String? value) {
                            if (value!.trim().isEmpty) {
                              return 'Enter First Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _titleTeController,
                          decoration:
                              const InputDecoration(hintText: 'Last Name'),
                          validator: (String? value) {
                            if (value!.trim().isEmpty) {
                              return 'Enter Last Name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        TextFormField(
                          controller: _descripTeController,
                          maxLines: 8,
                          decoration:
                              const InputDecoration(hintText: 'Write Review'),
                          validator: (String? value) {
                            if (value!.trim().isEmpty) {
                              return 'Wirte your Review';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible: isAdded == false,
                            replacement:
                                const Center(child: CircularProgressIndicator()),
                            child: ElevatedButton(
                              onPressed: addnewTask,
                              child: const Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addnewTask() async {
    if (_formkey.currentState!.validate()) {
      isAdded = true;
      if (mounted) {
        setState(() {});
      }
      final response =
          await NetworkCaller().postRequest(Urls.createReview, body: {
        "description":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        "product_id": 2,
        "rating": 5
      });
      isAdded = false;
      if (mounted) {
        setState(() {});
      }
      if (response.isSuccess) {
        clearTextfiled();

        if (mounted) {}
      } else {
        if (mounted) {
          // ShowSnackMessage(context, 'Something went wrong',true);
        }
      }
    }
  }

  void clearTextfiled() {
    _descripTeController.clear();
    _titleTeController.clear();
  }

  @override
  void dispose() {
    _titleTeController.dispose();
    _descripTeController.clear();
    super.dispose();
  }
}
