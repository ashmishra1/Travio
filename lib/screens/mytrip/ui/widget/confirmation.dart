import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travio/screens/mytrip/controller/mytrip.dart';
import 'package:travio/utils/shared/app_colors.dart';
import 'package:travio/utils/shared/ui_helpers.dart';
import 'package:travio/utils/widgets/box_button.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    MyTripController myTripController = Get.put(MyTripController());
    myTripController.getDate();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.orange.withOpacity(0.05),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        size: 20.0,
                      ),
                    ),
                    horizontalSpaceSmall,
                    const Text(
                      'confirm',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceLarge,
              const ConfirmCard(),
              verticalSpaceMedium,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40.0),
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Row(
                        children: const [
                          Icon(CupertinoIcons.tag),
                          horizontalSpaceSmall,
                          Text('Apply Coupon'),
                        ],
                      )),
                      Text(
                        'remove',
                        style: TextStyle(
                          color: color1,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              verticalSpaceMedium,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Trip details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              verticalSpaceRegular,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Trip Cost'),
                          Text(
                            'Rs. 570',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('tax'),
                          Text(
                            'Rs. 10',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Discount'),
                          Text(
                            '- Rs. 40',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceRegular,
                      Divider(
                        thickness: 0.9,
                      ),
                      verticalSpaceRegular,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('total'),
                          Text(
                            'Rs. 540',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      BoxButton(
                        title: 'BOOK TICKET',
                        onTap: () {
                          print(myTripController.wishList[0].name);
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmCard extends StatelessWidget {
  const ConfirmCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTripController myTripController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        height: 240.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.network(
                    "https://i.pinimg.com/originals/54/2c/7e/542c7e0c990d70f3e732b8a9cf64815f.png",
                    fit: BoxFit.cover,
                    width: 200.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'travio',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        horizontalSpaceTiny,
                        Text(
                          'trips',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 20.0),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Row(
                      children: [
                        const Text('Date :'),
                        horizontalSpaceTiny,
                        InkWell(
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: myTripController.date,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );

                            if (newDate == null) return;

                            myTripController.date = newDate;
                            myTripController.getDate();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(
                                5.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => Text(
                                  myTripController.formatDate.value,
                                  style: const TextStyle(fontSize: 12.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    const Text('Members :'),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            if (myTripController.members.value > 1) {
                              myTripController.members.value -= 1;
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(Icons.remove)),
                          ),
                        ),
                        horizontalSpaceSmall,
                        // Text(members.toString()),
                        Obx(
                          () => Text(myTripController.members.value.toString()),
                        ),
                        horizontalSpaceSmall,
                        InkWell(
                          onTap: () async {
                            myTripController.members.value += 1;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(Icons.add)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            verticalSpaceSmall,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Your Total'),
                  Text(
                    'Rs. 540',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
