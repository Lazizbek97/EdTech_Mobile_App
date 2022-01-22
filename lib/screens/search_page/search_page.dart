import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udemy_coupons/models/model_udemy.dart';

import '../../size_config.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  List<ModelUdemy> data;
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _textController = TextEditingController();

  bool dataFounded = false;
  List<ModelUdemy> foundedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        leadingWidth: getWidth(80),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SvgPicture.asset("assets/images/back.svg"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: "Search course",
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 35.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      foundedData.clear();
                      dataFounded = false;
                    });
                    for (var item in widget.data) {
                      if (item.title!.toLowerCase().contains(value)) {
                        dataFounded = true;
                        foundedData.add(item);
                        setState(() {});
                      }
                      if (foundedData.length == 20) {
                        dataFounded = false;
                        setState(() {});
                      }
                    }
                  },
                ),
              ),
              Container(
                height: 650,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: dataFounded
                    ? ListView.builder(
                        itemCount: foundedData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/about",
                                  arguments: foundedData[index]);
                            },
                            child: Container(
                              height: getHeight(217),
                              width: getWidth(343),
                              margin: EdgeInsets.symmetric(
                                horizontal: getWidth(10),
                                vertical: getHeight(5),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(foundedData[index]
                                              .thumbnail
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: getHeight(80),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: getWidth(15),
                                      vertical: getHeight(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          foundedData[index].category![0],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            foundedData[index].title.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : IfDataNotFound(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IfDataNotFound extends StatelessWidget {
  const IfDataNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/search.png"),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Text(
            "Course not found",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        SizedBox(
          width: getWidth(250),
          height: getHeight(100),
          child: const Text(
            "Try searching the course with a different keyword",
            style: TextStyle(
                height: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
