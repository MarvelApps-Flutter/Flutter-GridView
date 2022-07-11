import 'package:flutter/material.dart';
import 'package:gridview_module/constant/image_constant.dart';
import 'package:gridview_module/model/DataList/data.dart';
import 'package:gridview_module/widget/common_component.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> isSelectedLabel = [];
  List<bool> isSelectedFood = [];
  final Data _data = Data();

  setSelectedFoodLabel(int index) {
    isSelectedLabel.clear();
    for (var i = 0; i <= _data.foodLabel.length; i++) {
      isSelectedLabel.add(false);
    }
    setState(() {
      isSelectedLabel[index] = true;
    });
  }

  setSelectedFoodType(int index) {
    isSelectedFood.clear();
    for (var i = 0; i <= _data.foodType.length; i++) {
      isSelectedFood.add(false);
    }
    setState(() {
      isSelectedFood[index] = true;
    });
  }

  setSelectedBottomIcon(int index) {
    for (var i = 0; i <= _data.bottomAppBarItemList.length; i++) {
      _data.bottomAppBarItemList[index].isSelected = false;
    }
    setState(() {
      _data.bottomAppBarItemList[index].isSelected = true;
    });
  }

  @override
  void initState() {
    setSelectedFoodLabel(1);
    setSelectedFoodType(1);
    setSelectedBottomIcon(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Row(
                    children: [
                      const Text('Menu',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'NotoSerif',
                            fontWeight: FontWeight.bold,
                          )),
                      const Spacer(),
                      Icon(Icons.search, color: Colors.grey.shade600),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _data.foodLabel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setSelectedFoodLabel(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: isSelectedLabel[index]
                                    ? Colors.yellow.shade600
                                    : Colors.grey.shade400,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 6),
                              child: Text(_data.foodLabel[index],
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontFamily: 'NotoSerif',
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Row(
                      children: List<Widget>.generate(
                        _data.foodType.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              setSelectedFoodType(index);
                            },
                            child: Text(
                              _data.foodType[index],
                              style: TextStyle(
                                  fontFamily: 'NotoSerif',
                                  color: isSelectedFood[index]
                                      ? Colors.black
                                      : Colors.grey.shade600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  LimitedBox(
                      maxHeight: MediaQuery.of(context).size.height * 10,
                      child: _body()),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  GridView _body() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: _data.menuItem.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 5.0,
          childAspectRatio: 0.6),
      itemBuilder: (BuildContext context, int index) {
        return _menuItemGridViewContainer(context, index);
      },
    );
  }

  Widget _menuItemGridViewContainer(BuildContext context, int index) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                    color: Colors.white,
                    child: FadeInImage(
                      image:
                          Image.network(_data.menuItem[index].imageUrl).image,
                      placeholder: Image.asset(
                        ImageConstant.placeHolderLogo,
                        fit: BoxFit.contain,
                      ).image,
                    ))),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              _data.menuItem[index].name,
              textAlign: TextAlign.start,
              maxLines: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Row(
                  children: List.generate(5, (index1) {
                    return CommonComponent.getRating(context, index, index1);
                  }),
                ),
                Text('(${_data.menuItem[index].reviewCount.ceil()})'),
              ],
            ),
          ),
          Row(
            children: [
              Text('\$ ${_data.menuItem[index].amount}'),
              const Spacer(),
              InkWell(
                  onTap: () {
                    _showModalBottomSheet(context, index);
                  },
                  child: const Icon(Icons.add_box_rounded)),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showModalBottomSheet(BuildContext context, int index) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
        ),
        builder: (context) {
          return _modalBottomSheetContent(context, index);
        });
  }

  Padding _modalBottomSheetContent(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 80,
            child: Divider(
              height: 5,
              thickness: 5,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                const Text(
                  'Your Order',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'NotoSerif',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.delete,
                  color: Colors.grey.shade300,
                )
              ],
            ),
          ),
          Divider(
            height: 2,
            thickness: 1,
            color: Colors.grey.shade200,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _data.menuItem[index].name,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'NotoSerif',
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "500 gm",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'NotoSerif',
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    const Spacer(),
                    Text('\$ ${_data.menuItem[index].amount.toString()}'),
                  ],
                ),
              ),
              Divider(
                height: 2,
                thickness: 1,
                color: Colors.grey.shade200,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSerif',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade300),
                ),
                const Spacer(),
                Text('\$ ${_data.menuItem[index].amount.toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSerif',
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.3,
                      vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  )),
              onPressed: () {},
              child: const Text('Add to Cart',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NotoSerif',
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
        ],
      ),
    );
  }

  Container _bottomNavigationBar(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 80,
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_data.bottomAppBarItemList.length, (index) {
            return GestureDetector(
              onTap: () {
                for (var e in _data.bottomAppBarItemList) {
                  e.isSelected = false;
                }
                setState(() {
                  _data.bottomAppBarItemList[index].isSelected = true;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _data.bottomAppBarItemList[index].icon,
                    color: _data.bottomAppBarItemList[index].isSelected
                        ? Colors.amber
                        : Colors.grey.shade600,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    _data.bottomAppBarItemList[index].lable,
                    style: TextStyle(
                      color: _data.bottomAppBarItemList[index].isSelected
                          ? Colors.amber
                          : Colors.grey.shade600,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
