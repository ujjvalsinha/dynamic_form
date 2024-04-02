import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:polaris_assignment/core/enum/form_type.dart';
import 'package:polaris_assignment/features/dynamic_form/presentation/cubit/dynamic_form_cubit.dart';
import 'package:polaris_assignment/features/dynamic_form/presentation/widgets/checkbox_widget.dart';
import 'package:polaris_assignment/features/dynamic_form/presentation/widgets/dropdown_widget.dart';
import 'package:polaris_assignment/features/dynamic_form/presentation/widgets/radiogroup.dart';
import 'package:polaris_assignment/features/dynamic_form/presentation/widgets/textfield_widget.dart';

class DynamicFormScreen extends StatefulWidget {
  const DynamicFormScreen({super.key});

  @override
  State<DynamicFormScreen> createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isFormValid = false;
  final List<String> _selectedImages = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DynamicFormCubit, DynamicFormState>(
        builder: (context, state) {
          if (state is DynamicFormLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DynamicFormLoaded) {
            return Form(
              key: globalFormKey,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.formTitle,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: state.model.map((item) {
                              if (item.formType == FormType.editText) {
                                return TextFieldWidget(
                                  label: item.label,
                                  mandatory: item.mandatory,
                                  textInputType: item.textInputType,
                                  onChanged: (data) {
                                    context
                                        .read<DynamicFormCubit>()
                                        .dataOnChanges(item.label, data);
                                    item.copyWith(inputData: data);
                                    debugPrint("data is $data");
                                  },
                                );
                              } else if (item.formType == FormType.dropDown) {
                                return DropDownWidget(
                                  label: item.label,
                                  options: item.options,
                                  mandatory: item.mandatory,
                                  onSelectionChanged: (selectedOptions) {
                                    context
                                        .read<DynamicFormCubit>()
                                        .dataOnChanges(
                                            item.label, selectedOptions);
                                    debugPrint(
                                        'Selected options: $selectedOptions');
                                  },
                                );
                              } else if (item.formType == FormType.checkBoxes) {
                                return CheckBoxWidget(
                                  label: item.label,
                                  options: item.options,
                                  mandatory: item.mandatory,
                                  onSelectionChanged: (selectedOptions) {
                                    context
                                        .read<DynamicFormCubit>()
                                        .dataOnChanges(
                                            item.label, selectedOptions);
                                    // widget.viewModel.copyWith(inputData: selectedOptions);
                                    debugPrint(
                                        'Selected options: $selectedOptions');
                                  },
                                );
                              } else if (item.formType == FormType.radioGroup) {
                                return RadioGroupWidget(
                                  label: item.label,
                                  options: item.options,
                                  mandatory: item.mandatory,
                                  onSelectionChanged: (selectedOptions) {
                                    context
                                        .read<DynamicFormCubit>()
                                        .dataOnChanges(
                                            item.label, selectedOptions);
                                    // widget.viewModel.copyWith(inputData: selectedOptions);
                                    debugPrint(
                                        'Selected options: $selectedOptions');
                                  },
                                );
                              } else if (item.formType ==
                                  FormType.captureImages) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: ImageBuilderTile(
                                    pickImageCallBack: (images) async {
                                      _selectedImages.addAll(images);
                                      // await context
                                      //     .read<DynamicFormCubit>()
                                      //     .uploadImagesToS3(images);

                                      context
                                          .read<DynamicFormCubit>()
                                          .dataOnChanges(
                                              item.label, _selectedImages);
                                    },
                                  ),
                                );
                              }
                              return Text(item.label);
                            }).toList(),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () async {
                            // // Iterate through form items and check validation
                            // for (var item in state.model) {
                            //   if (item.mandatory && item.inputData == null) {
                            //     // Item is mandatory but has no input, set form as invalid
                            //     isFormValid = false;
                            //     break;
                            //   }
                            // }

                            // if (globalFormKey.currentState?.validate() ??
                            //     false) {
                            // if (context
                            //     .read<DynamicFormCubit>()
                            //     .validateForm(context)) {
                            await context
                                .read<DynamicFormCubit>()
                                .onFormSubmit(_selectedImages);
                            // }
                            // }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            alignment: Alignment.center,
                            width: size.width * .8,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 62, 146, 65),
                              // Set button color based on form validity
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        // GestureDetector(
                        //   onTap: () async {
                        //     if (globalFormKey.currentState?.validate() ??
                        //         false) {
                        //       context
                        //           .read<DynamicFormCubit>()
                        //           .onFormSubmit(_selectedImages);
                        //     }
                        //   },
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(vertical: 8),
                        //     alignment: Alignment.center,
                        //     width: size.width * .8,
                        //     decoration: BoxDecoration(
                        //       color: const Color.fromARGB(255, 62, 146, 65),
                        //       borderRadius: BorderRadius.circular(25),
                        //     ),
                        //     child: const Text(
                        //       "Submit",
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  )

                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       state.formTitle,
                  //       style: const TextStyle(
                  //           fontSize: 24, fontWeight: FontWeight.w500),
                  //     ),
                  //     const SizedBox(height: 8),
                  //     Expanded(
                  //       child: ListView.builder(
                  //         itemCount: state.model.length,
                  //         itemBuilder: (context, index) {
                  //           final item = state.model[index];
                  //           if (item.formType == FormType.editText) {
                  //             return TextFieldWidget(
                  //               label: item.label,
                  //               mandatory: item.mandatory,
                  //               textInputType: item.textInputType,
                  //               onChanged: (data) {
                  //                 context
                  //                     .read<DynamicFormCubit>()
                  //                     .dataOnChanges(item.label, data);
                  //                 item.copyWith(inputData: data);
                  //                 debugPrint("data is $data");
                  //               },
                  //             );
                  //           } else if (item.formType == FormType.dropDown) {
                  //             return DropDownWidget(
                  //               label: item.label,
                  //               options: item.options,
                  //               mandatory: item.mandatory,
                  //               onSelectionChanged: (selectedOptions) {
                  //                 context
                  //                     .read<DynamicFormCubit>()
                  //                     .dataOnChanges(item.label, selectedOptions);
                  //                 debugPrint(
                  //                     'Selected options: $selectedOptions');
                  //               },
                  //             );
                  //           } else if (item.formType == FormType.checkBoxes) {
                  //             return CheckBoxWidget(
                  //               label: item.label,
                  //               options: item.options,
                  //               mandatory: item.mandatory,
                  //               onSelectionChanged: (selectedOptions) {
                  //                 context
                  //                     .read<DynamicFormCubit>()
                  //                     .dataOnChanges(item.label, selectedOptions);
                  //                 // widget.viewModel.copyWith(inputData: selectedOptions);
                  //                 debugPrint(
                  //                     'Selected options: $selectedOptions');
                  //               },
                  //             );
                  //           } else if (item.formType == FormType.radioGroup) {
                  //             return RadioGroupWidget(
                  //               label: item.label,
                  //               options: item.options,
                  //               mandatory: item.mandatory,
                  //               onSelectionChanged: (selectedOptions) {
                  //                 context
                  //                     .read<DynamicFormCubit>()
                  //                     .dataOnChanges(item.label, selectedOptions);
                  //                 // widget.viewModel.copyWith(inputData: selectedOptions);
                  //                 debugPrint(
                  //                     'Selected options: $selectedOptions');
                  //               },
                  //             );
                  //           } else if (item.formType == FormType.captureImages) {
                  //             return Padding(
                  //               padding:
                  //                   const EdgeInsets.only(top: 8.0, bottom: 8),
                  //               child: ImageBuilderTile(
                  //                 pickImageCallBack: (images) {
                  //                   _selectedImages.addAll(images);
                  //                 },
                  //               ),
                  //             );
                  //           }
                  //           return Text(item.label);
                  //         },
                  //       ),
                  //     ),
                  //     Align(
                  //       alignment: Alignment.center,
                  //       child: GestureDetector(
                  //         onTap: () async {
                  //           if (globalFormKey.currentState?.validate() ?? false) {
                  //             context
                  //                 .read<DynamicFormCubit>()
                  //                 .onFormSubmit(_selectedImages);
                  //           }
                  //         },
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(vertical: 8),
                  //           alignment: Alignment.center,
                  //           width: size.width * .8,
                  //           decoration: BoxDecoration(
                  //               color: const Color.fromARGB(255, 62, 146, 65),
                  //               borderRadius: BorderRadius.circular(25)),
                  //           child: const Text(
                  //             "Submit",
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.w500,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(height: 8)
                  //   ],
                  // ),
                  ),
            );

            // ListView(
            //   children: [Text(state.model.toString())],
            // );
          } else if (state is DynamicFormError) {
            return const Center(
              child: Text("Error while loading data"),
            );
          } else {
            return const Center(
              child: Text("Errrrr else"),
            );
          }
        },
      ),
    );
  }
}

class ImageBuilderTile extends StatefulWidget {
  const ImageBuilderTile({
    super.key,
    required this.pickImageCallBack,
  });

  final Function(List<String> selectedImagePath) pickImageCallBack;

  @override
  State<ImageBuilderTile> createState() => _ImageBuilderTileState();
}

class _ImageBuilderTileState extends State<ImageBuilderTile> {
  List<String> _selectedImagesPath = [];

  // Pick Images
  Future<void> _pickImages() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();
    _selectedImagesPath = images.map((image) => (image.path)).toList();
    setState(() {});
    widget.pickImageCallBack(_selectedImagesPath);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Show selected images preview and confirm button
          if (_selectedImagesPath.isNotEmpty)
            GridView.builder(
              primary: true,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: _selectedImagesPath.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final file = File(_selectedImagesPath[index]);
                return Image.file(
                  file,
                  fit: BoxFit.cover,
                );
              },
            ),
          if (_selectedImagesPath.isEmpty) // Show button to select images
            GestureDetector(
              onTap: () => _pickImages(),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * .6,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 108, 195, 111),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "Add Image",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
