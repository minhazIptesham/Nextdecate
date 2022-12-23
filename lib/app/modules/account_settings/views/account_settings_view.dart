import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gameleven/app/data/utiles/app_strings.dart';
import 'package:gameleven/app/data/utiles/local_helper/shared_value_helper.dart';

import 'package:get/get.dart';

import '../../../data/models/shipping_address_model.dart';
import '../../../global_widgets/customAppBarWidget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/account_settings_controller.dart';

class AccountSettingsView extends GetView<AccountSettingsController> {
  const AccountSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var selected = "Language";
    return SafeArea(
      child: Scaffold(
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarWidget(AppStrings.account),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 186.0,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // image != null
                    //     ? ClipOval(
                    //         child: Image.file(image!,
                    //             width: 120, height: 120, fit: BoxFit.cover),
                    //       )
                    //     : Center(child: const Text("Image not found")),

                    CircleAvatar(
                      radius: 40,
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: const BoxDecoration(
                          //color: Colors.red,
                          // borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                              image: AssetImage('assets/profile_holder.png'),
                              fit: BoxFit.cover),
                        ),
                        child: const  Center(child: Text("")),
                      ),
                    ),
                     Text(user_name.$,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color:  Color(0xFF404040),
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                      ),
                    ),
                    Text(
                     user_phone.$,
                      style:const TextStyle(
                        fontSize: 12.0,
                        color:  Color(0xFF9F9F9F),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),

              _accountMenuItem(),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 400.0,
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
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 10, top: 20, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Order Details

                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.ORDER);
                        },
                        child: Container(
                          width: 416.0,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
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
                                    child: Icon(
                                      Icons.home,
                                      color: const Color(0xFFD81D4C),
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    'Orders',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: const Color(0xFFD81D4C),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  color: Color.fromARGB(255, 228, 225, 225),
                                  height: 1,
                                  width:
                                  MediaQuery.of(context).size.width / 1.5,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      // Login

                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.AUTHENTICATION);
                        },
                        child: Container(
                          width: 416.0,
                          height: 52.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
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
                                    child: const Icon(
                                      Icons.app_registration,
                                      color: Color(0xFFD81D4C),
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  const Text(
                                    'Register ',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                             /* Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  color: Color.fromARGB(255, 228, 225, 225),
                                  height: 1,
                                  width:
                                  MediaQuery.of(context).size.width / 1.5,
                                ),
                              )*/
                            ],
                          ),
                        ),
                      ),

                      // Edit Profile

                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.UPDATE_PROFILE);
                        },
                        child: Container(
                          width: 416.0,
                          height: 52.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
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
                                    child: const Icon(
                                      Icons.person_outline,
                                      size: 30,
                                      color: Color.fromARGB(255, 8, 134, 224),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  const Text(
                                    'Profile',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Color(0xFF404040),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  color: Color.fromARGB(255, 228, 225, 225),
                                  height: 1,
                                  width:
                                  MediaQuery.of(context).size.width / 1.5,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      // Address

                     /* Container(
                        width: 416.0,
                        height: 52.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
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
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Text(
                                  'Address',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: const Color(0xFF404040),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                color: Color.fromARGB(255, 228, 225, 225),
                                height: 1,
                                width:
                                MediaQuery.of(context).size.width / 1.5,
                              ),
                            )
                          ],
                        ),
                      ),*/

                      // Change Language

                      Container(
                        width: 416.0,
                        height: 52.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
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
                                  child: Icon(
                                    Icons.change_circle,
                                    size: 30,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      selected,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: const Color(0xFF404040),
                                      ),
                                    ),
                                    DropdownButton(
                                      iconSize: 30,
                                      alignment: Alignment.centerRight,
                                      underline:
                                      Container(color: Colors.white),
                                      items: const[
                                        DropdownMenuItem(
                                          value: "Language",
                                          child: Text("Select Language"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Bangla",
                                          child: Text("Bangla"),
                                        ),
                                        DropdownMenuItem(
                                          value: "English",
                                          child: Text("English"),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        /*setState(() {
                                          selected = "$value";
                                        });*/
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                color: Color.fromARGB(255, 228, 225, 225),
                                height: 1,
                                width:
                                MediaQuery.of(context).size.width / 1.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Logout
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 10),
                child: GestureDetector(
                  onTap: () {
                   Get.toNamed(Routes.AUTHENTICATION);

                   /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInPage()));*/
                  },
                  child: Container(
                    width: 416.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
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
                              child: Icon(
                                Icons.logout,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: const Color(0xFF404040),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        )
      ),
    );
  }


  _accountMenuItem(){
    return ListTile(leading: Icon(Icons.category),title: Text('Menu Item'),trailing: Icon(Icons.arrow_forward_outlined),);
  }

}
