import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List itemList = [9, 8, 7, 6, 5, 4, 3, 2, 1];
  List operationList = ["+", "+", "+", "+", "="];
  String sum = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8),
                    child: Text(
                      sum,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white70),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 16, right: 16, top: 16),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      sum = "";
                                    }),
                                    child: Container(
                                      margin: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.red,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "AC",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(color: Colors.white70),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      sum = sum.substring(0, sum.length - 1);
                                    }),
                                    child: Container(
                                      margin: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.redAccent,
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: 36,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 9,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 4,
                                              crossAxisSpacing: 4,
                                              crossAxisCount: 3),
                                      itemBuilder: ((context, index) =>
                                          GestureDetector(
                                            onTap: () => setState(() {
                                              sum += itemList[index].toString();
                                            }),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                itemList[index].toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium,
                                              )),
                                            ),
                                          ))),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      if (sum.isNotEmpty) {
                                        sum += "0";
                                      }
                                    }),
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          0.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 16, top: 16, bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                      child: Column(
                        children: [
                          ...operationList
                              .map((e) => Expanded(
                                    child: GestureDetector(
                                      onTap: e != "="
                                          ? () => setState(() {
                                                sum += "+";
                                              })
                                          : () => setState(() {
                                                List sumOperationList =
                                                    sum.split("+");
                                                sum = (
                                                  int.parse(
                                                        sumOperationList[0],
                                                      ) +
                                                      int.parse(
                                                        sumOperationList[1],
                                                      ),
                                                ).toString().replaceAll(
                                                    RegExp(r'[()]'), '');
                                              }),
                                      child: Container(
                                        margin: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(200),
                                        ),
                                        child: Center(
                                            child: Text(
                                          e,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                        )),
                                      ),
                                    ),
                                  ))
                              .toList()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
