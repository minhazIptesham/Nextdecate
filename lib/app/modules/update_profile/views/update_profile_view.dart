import 'package:flutter/material.dart';
import 'package:gameleven/app/data/models/country_model.dart';
import 'package:gameleven/app/data/models/shipping_address_model.dart';
import 'package:gameleven/app/data/models/user_profile_model.dart';
import 'package:gameleven/app/data/utiles/api_url.dart';
import 'package:gameleven/app/data/utiles/local_helper/shared_value_helper.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/utiles/app_colors.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../global_widgets/custom_text_field_widget.dart';
import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var updateFormKey = GlobalKey<FormFieldState>();

    List<String> country = [
      'Bangladesh',
      'China',
      'India',
      'Pakistan',
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade100,
            child: Obx(() {
              if (controller.profileInfo != []) {
                if (controller.isLoadingGetProfileData.value) {
                  return ListView.builder(
                      itemCount: controller.profileInfo.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        UserProfileModel uInfo = controller.profileInfo[index];
                        print(ApiURL.globalUrl + uInfo.image.toString());

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomAppBarWidget(
                                'Update Profile',
                                isBackButton: true,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 186.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF9D9D9D)
                                          .withOpacity(0.16),
                                      offset: Offset(0, 0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            _buildBottomSheetPickerImageEditProfile(
                                                context);
                                          },
                                          child: CircleAvatar(
                                            radius: 50,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(60),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          ApiURL.globalUrl +
                                                              uInfo.image
                                                                  .toString()),
                                                      fit: BoxFit.cover)),
                                              // child: const Center(child: Text("dfdfd")),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: InkWell(
                                              onTap: () {
                                                _buildBottomSheetPickerImageEditProfile(
                                                    context);
                                              },
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey.shade100,
                                                  radius: 18,
                                                  child: const Icon(
                                                    Icons.edit,
                                                    color: Colors.black,
                                                  )),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${uInfo.firstName} ${uInfo.lastName}',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFF404040),
                                        fontWeight: FontWeight.w700,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              _headerProfileLine(context,
                                  'Personal Information', 'Edit', uInfo, 1),
                              _profileInfo('First Name', uInfo.firstName.toString()),
                              _profileInfo('Last Name', uInfo.lastName.toString()),
                              _profileInfo('Gender', 'Male'),
                              _profileInfo('Region ', 'Islam'),
                              _profileInfo('Date of Birth', '1/1/1995'),
                              _profileInfo(
                                  'Address', uInfo.address1.toString()),
                              _profileInfo('City', uInfo.city.toString()),
                              _profileInfo('State', uInfo.state.toString()),
                              _profileInfo('Zip Code', uInfo.zip.toString()),
                              SizedBox(height: 5),
                              _headerProfileLine(context, 'Contact Information',
                                  'Edit', uInfo, 2),
                              _profileInfo('Phone', uInfo.mobile.toString()),
                              _profileInfo('Mail', uInfo.email.toString()),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })),
      ),
    );
  }

  _headerProfileLine(context, leftTitle, rightTitle, data, int id) {
    return InkWell(
      onTap: () {
        //
        if (id == 1) {
          /// personal info update
          _buildBottomSheetCreateAddressCheckOut(context, data);
        } else {
          /// contact info update
          _buildBottomSheetUpdateContact(context, data);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF9D9D9D).withOpacity(0.16),
              offset: Offset(0, 0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 8.0, bottom: 8.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                leftTitle,
                style: TextStyle(
                  fontSize: 14.0,
                  color: const Color(0xFF404040),
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                rightTitle,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _profileInfo(String profileKey, String profileValue) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              profileKey,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              ' :     ' + profileValue,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  /// Profile Update  Address  BottomSheet
  _buildBottomSheetCreateAddressCheckOut(context, UserProfileModel data) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.zero,
              topLeft: Radius.circular(30), //Radius.zero,
              //bottomRight: Radius.circular(20),
              topRight: Radius.circular(30)),
          side: BorderSide(width: 1, color: CtmColors.appColor)),
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'First Name'),
                            _customInputFieldBottomSheet(
                                data.firstName.toString(),
                                controller.firstNameCTR,
                                TextInputType.text),
                          ],
                        ),
                      ),
                      _spaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'Last Name'),
                            _customInputFieldBottomSheet(
                                data.lastName.toString(),
                                controller.lastNameCTR,
                                TextInputType.text),
                          ],
                        ),
                      )
                    ],
                  ),
                  _spaceH10(),
                  _headLineText(headName: 'Address'),
                  _customInputFieldBottomSheet(data.address1.toString(),
                      controller.address1CTR, TextInputType.text),
                  _spaceH10(),

                  /* _headLineText(headName: 'Email'),
                  _customInputFieldBottomSheet(data.email.toString(),controller.emailCTR),
                  _spaceH10(),
                  _headLineText(headName: 'Contact Number'),
                  _customInputFieldBottomSheet(data.mobile.toString(),controller.contactCTR),*/
                  /*     _spaceH10(),
                  */ /*  _headLineText(headName: 'Date of Birth'),
                  InkWell(
                    onTap: () {
                      _selectDateDepart(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Enter your date of Birth',
                              style: TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            Icon(Icons.calendar_month_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),*/ /*
                  _spaceH10(),
                  // _headLineText(headName: 'Gender'),
                  */ /*  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 5, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _gender(),
                            const Text(
                              'Male',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _gender(),
                            const Text(
                              'Female',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _gender(),
                            const Text(
                              'Others',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),*/ /*
                  _spaceH10(),
                  _headLineText(headName: 'Address*'),
                  _customInputFieldBottomSheet(data.customerAddress1.toString()),
                */
                  _spaceH10(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'City'),
                            _customInputFieldBottomSheet(data.city.toString(),
                                controller.cityCTR, TextInputType.text),
                          ],
                        ),
                      ),
                      _spaceW10(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _headLineText(headName: 'ZIP'),
                            _customInputFieldBottomSheet(data.zip.toString(),
                                controller.zipCTR, TextInputType.number),
                          ],
                        ),
                      )
                    ],
                  ),
                  _spaceH10(),
                  _headLineText(headName: 'Country'),
                  _countryListDropDown(data.country.toString()),
                  _spaceH10(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _headLineText(headName: 'State'),
                      _stateListDropDown(data.state.toString()),

                      /// Drop Down
                    ],
                  ),
                  _spaceH10(),
                  _spaceH10(),
                  ElevatedButton(
                    onPressed: () {
                      print('Update Profile Click ');

                      print(controller.lastNameCTR.text);
/*

                      Map<String ,dynamic> userUpdateMap ={
                          'user_id': user_id.$,
                          'full_name':data.firstName,
                          'first_name':data.firstName,
                          'last_name':data.lastName,
                          'email':data.email,
                          'address_1':data.address1,
                          'address_2':data.address2,
                          'city':data.city,
                          'state':data.state,
                          'country':data.country,
                          'zip':data.zip,
                          'mobile':data.mobile,
                          'company':data.company,
                      };
*/

                      //  print(userUpdateMap);
                      controller.userUpdateController(context: context);

                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CtmColors.appColor,
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      'Update Profile'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        height: 1.36,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// contact Update BottomSheet
  _buildBottomSheetUpdateContact(context, UserProfileModel data) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.zero,
              topLeft: Radius.circular(30), //Radius.zero,
              //bottomRight: Radius.circular(20),
              topRight: Radius.circular(30)),
          side: BorderSide(width: 1, color: CtmColors.appColor)),
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headLineText(headName: 'Email'),
                _customInputFieldBottomSheet(data.email.toString(),
                    controller.emailCTR, TextInputType.text),
                _spaceH10(),
                _headLineText(headName: 'Contact Number'),
                _customInputFieldBottomSheet(data.mobile.toString(),
                    controller.contactCTR, TextInputType.number),
                _spaceH10(),
                _spaceH10(),
                ElevatedButton(
                  onPressed: () {
                    print('Update Profile Click ');
                    controller.userUpdateController(context: context);
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CtmColors.appColor,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: Text(
                    'Update Profile'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      height: 1.36,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _customInputFieldBottomSheet(String hintName,
      TextEditingController inputController, TextInputType? keyboardTyp) {
    return TextFormField(
      controller: inputController,
      keyboardType: keyboardTyp,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: const OutlineInputBorder(),
          hintText: hintName,
          hintStyle: const TextStyle(fontSize: 14,color: Colors.black)),
      onTap: () {
        /// Save
      },
      //validator: (value){},
    );
  }

  _buildBottomSheetPickerImageEditProfile(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.zero,
              topLeft: Radius.circular(30), //Radius.zero,
              //bottomRight: Radius.circular(20),
              topRight: Radius.circular(30)),
          side: BorderSide(width: 1, color: CtmColors.appColor)),
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _spaceH10(),
                _headLineText(
                    headName: 'Please Select your Image Picker Options'),
                _spaceH10(),
                InkWell(
                  onTap: () {
                    _uploadCameraGalleryPicker(ImageSource.camera);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)
                        // color: Colors.grey

                        ),
                    child: const ListTile(
                        title: Text(
                          'Upload your image from camera',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        leading: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                Colors.blueAccent, //CtmColors.appColor,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 25,
                            ))),
                  ),
                ),
                _spaceH10(),
                InkWell(
                  onTap: () {
                    Get.back();
                    _uploadCameraGalleryPicker(ImageSource.gallery);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)
                        // color: Colors.grey

                        ),
                    child: const ListTile(
                        title: Text(
                          'Upload your image from gallery',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        leading: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                Colors.blueAccent, //CtmColors.appColor,
                            child: Icon(
                              Icons.upload,
                              size: 25,
                            ))),
                  ),
                ),
                _spaceH10(),
              ],
            ),
          ),
        );
      },
    );
  }

  _headLineText({required String headName}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        headName,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: CtmColors.appColor),
      ),
    );
  }

  _spaceH10() {
    return const SizedBox(
      height: 10,
    );
  }

  _spaceW10() {
    return const SizedBox(
      width: 10,
    );
  }

  Future _uploadCameraGalleryPicker(ImageSource pickerSource) async {
    //final List<XFile>? images = await _picker.pickMultiImage();
    try {
      controller.imagePick =
          await ImagePicker().pickImage(source: pickerSource);
      if (controller.imagePick == null) return;
      print('Image Path :${controller.imagePick!.path}');
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  _countryListDropDown(String countryId) {
    return Obx(() {
      if (controller.countryList.isEmpty) {
        return const Text('');
      } else {
        return DropdownButton(
          isExpanded: true,
          underline: const SizedBox(),
          isDense: true,
          value: controller.countryInitValue.value==''?controller.countryList[0].id :controller.countryInitValue.value, // controller.countryInitValue.value,
          hint: const Text("Select  Country ",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              )),
          items: controller.countryList.map((country) {
            return DropdownMenuItem(
              value: country.id,
              child: Text(
                country.name.toString(),
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: const TextStyle(fontSize: 12),
              ),
            );
          }).toList(),
          onChanged: (countryFormId) {
            controller.countryInitValue.value = countryFormId.toString();
            controller.country = countryFormId.toString();
            controller.getStateByCountryIdController();
            print(
                "You selected Country Id   : ${controller.countryInitValue.value}");
          },
        );
      }
    });
  }

  /// State List UI 80% (testing )
  _stateListDropDown(String stateId) {
    return Obx(() {
      if (controller.stateList.isEmpty) {
        return Container();
      } else {
        return DropdownButton(
          isExpanded: true,
          underline: const SizedBox(),
          isDense: true,
          value: controller.stateInitValue.value==''? controller.stateList[0].id:controller.stateInitValue.value,
          hint: const Text("Select State ",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              )),
          items: controller.stateList.map((stateInfo) {
            return DropdownMenuItem(
              value: stateInfo.id,
              child: Text(
                stateInfo.name.toString(),
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: const TextStyle(fontSize: 12),
              ),
            );
          }).toList(),
          onChanged: (countryFormId) {
            controller.stateInitValue.value = countryFormId.toString();
            print("You selected State Id   : $countryFormId");
          },
        );
      }
    });
  }
}
