import 'package:firebase_test/model/destination_model.dart';
import 'package:firebase_test/model/menu_model.dart';
import 'package:firebase_test/utils/constants.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  List<MenuModel> menuList = <MenuModel>[
    MenuModel(
      menuName: Constants.flights,
      icon: const Icon(
        Icons.flight,
        color: Colors.lightBlue,
      ),
    ),
    MenuModel(
      menuName: Constants.train,
      icon: const Icon(
        Icons.train,
        color: Colors.blueGrey,
      ),
    ),
    MenuModel(
      menuName: Constants.bus,
      icon: const Icon(
        Icons.directions_bus,
        color: Colors.green,
      ),
    ),
    MenuModel(
      menuName: Constants.taxi,
      icon: const Icon(
        Icons.local_taxi,
        color: Colors.red,
      ),
    ),
    MenuModel(menuName: Constants.more,
        icon: const Icon(Icons.apps,
        color: Colors.deepPurple,))
  ];

  List<DestinationModel> destinationList = <DestinationModel>[
    DestinationModel(
        destinationName: "Nusa Penida",
        countryName: "Bali, Indonessia",
        rating: 4.9),
    DestinationModel(
        destinationName: "Senggigi Beach",
        countryName: "Lombok, Indonessia",
        rating: 4.2),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            firstView(size),
            secondView(size),
          ],
        ),
      ),
    );
  }

  Widget firstView(Size size) {
    return Container(
      height: size.height * 0.35,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45.0),
            bottomRight: Radius.circular(45.0),
          ),
          color: Colors.black87),
    );
  }

  Widget secondView(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
      child: Column(
        children: [
          toSpace(vertically: size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              toSpace(horizontally: size.width * 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Constants.welcomeBack,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  toSpace(vertically: size.height * 0.01),
                  const Text(
                    Constants.userName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 12.0,
                      width: 12.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.notifications_none_sharp,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ],
                ),
              )
            ],
          ),
          toSpace(vertically: size.height * 0.03),
          searchBar(),
          toSpace(vertically: size.height * 0.03),
          menuWidget(menuList: menuList, size: size),
          toSpace(vertically: size.height * 0.03),
          headerWidget(headingName: Constants.popularDestinations),
          toSpace(vertically: size.height * 0.03),
          popularDestinationListWidget(
              destinationList: destinationList, size: size),
          toSpace(vertically: size.height * 0.03),
          headerWidget(headingName: Constants.travelCategories),
          toSpace(vertically: size.height * 0.03),
          popularDestinationListWidget(
              destinationList: destinationList, size: size),
        ],
      ),
    );
  }

  Widget toSpace({double? horizontally, double? vertically}) {
    return SizedBox(
      height: vertically ?? 0.0,
      width: horizontally ?? 0.0,
    );
  }

  Widget searchBar() {
    return TextFormField(
      style: const TextStyle(
          color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: Constants.searchSomethingHere,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
          size: 25.0,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        disabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }

  Widget menuWidget({List<MenuModel>? menuList, required Size size}) {
    return Container(
      height: size.height * 0.15,
      width: size.width,
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: menuList?.length ?? 0,
        itemBuilder: (context, index) {
          debugPrint("______ length : ${menuList?.length}");
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: menuList?[index].icon ?? const Icon(Icons.broken_image),
              ),
              toSpace(vertically: size.height * 0.02),
              Text(
                menuList?[index].menuName ?? "",
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            toSpace(horizontally: size.width * 0.07),
      ),
    );
  }

  Widget headerWidget({String? headingName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          Constants.popularDestinations,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          Constants.showAll,
          style: TextStyle(
              fontSize: 12,
              color: Colors.orangeAccent,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget popularDestinationListWidget(
      {List<DestinationModel>? destinationList, required Size size}) {
    return SizedBox(
      height: size.height * 0.30,
      width: size.width,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadiusDirectional.circular(15.0)),
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: size.height * 0.3,
                width: size.width * 0.45,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadiusDirectional.circular(15.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: size.width * 0.15,
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              destinationList?[index].rating.toString() ?? "0",
                              style: const TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              destinationList?[index].destinationName ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          toSpace(vertically: size.height * 0.005),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.blue,
                              ),
                              Text(
                                destinationList?[index].countryName ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              toSpace(horizontally: size.width * 0.08),
          itemCount: destinationList?.length ?? 0),
    );
  }
}
