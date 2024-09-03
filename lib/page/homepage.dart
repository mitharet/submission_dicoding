import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});
  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100.0,
        automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      title: Row(
        children: [
         
          const Icon(Icons.person, color: Colors.white,size: 50,),
          const SizedBox(width: 10),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text(
                'Selamat Datang...',
                style: TextStyle(
                  color: Color.fromRGBO(140, 140, 140, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 15
                ),
              ),
              const SizedBox(height: 6,),
              Text(
                widget.username,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                fontSize: 18
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notification actions here
            },
          ),
        ],
      ),
    ),
     
      body: ListView(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return const HeaderSearchWidget(
                visibleTop: true,
                visibleBottom: false,
                visible: false,
                paddingH: 20,
                paddingV: 40,
                marginH: 0,
                marginV: 0,
              );
            } else if (constraints.maxWidth <= 900) {
              return const HeaderSearchWidget(
                visibleTop: true,
                visibleBottom: false,
                visible: false,
                paddingH: 60,
                paddingV: 80,
                marginH: 0,
                marginV: 0,
              );
            } else if (constraints.maxWidth <= 1200) {
              return const HeaderSearchWidget(
                visibleTop: false,
                visibleBottom: true,
                visible: true,
                paddingH: 120,
                paddingV: 40,
                marginH: 60,
                marginV: 0,
              );
            } else {
              return const HeaderSearchWidget(
                visibleTop: false,
                visibleBottom: true,
                visible: true,
                paddingH: 120,
                paddingV: 60,
                marginH: 80,
                marginV: 0,
              );
            }
          }),
          const SizedBox(
            height: 20,
          ),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return const PropertyGridView(
                grideCount: 2,
              );
            } else if (constraints.maxWidth <= 900) {
              return const PropertyGridView(grideCount: 3);
            } else if (constraints.maxWidth <= 1200) {
              return const PropertyGridView(grideCount: 4);
            } else {
              return const PropertyGridView(grideCount: 6);
            }
          }),
        ],
      ),
    );
  }
}

class HeaderSearchWidget extends StatelessWidget {
  final bool visible;
  final bool visibleBottom;
  final bool visibleTop;
  final double paddingH;
  final double paddingV;
  final double marginH;
  final double marginV;
  const HeaderSearchWidget({
    super.key,
    required this.visible,
    required this.visibleBottom,
    required this.paddingH,
    required this.paddingV,
    required this.marginH,
    required this.marginV,
    required this.visibleTop,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: visible,
          child: Image.asset(
            'assets/images/img_banner_second.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Visibility(
          visible: visibleTop,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: marginH,
              vertical: marginV,
            ),
            padding: EdgeInsets.symmetric(
              vertical: paddingV,
              horizontal: paddingH,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF0E2638),
            ),
            child: const SearchWidget(),
          ),
        ),
        Visibility(
          visible: visibleBottom,
          child: Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: marginH,
                vertical: marginV,
              ),
              padding: EdgeInsets.symmetric(
                vertical: paddingV,
                horizontal: paddingH,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF0E2638),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const SearchWidget(),
            ),
          ),
        ),
      ],
    );
   
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            bottom: 20,
          ),
          child: Text(
            "Jelajahi Rumah Impianmu",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Expanded(
                flex: 7,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: "Search",
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PropertyGridView extends StatelessWidget {
  final int grideCount;
  const PropertyGridView({
    super.key,
    required this.grideCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Padding(
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 20,
    //   ),
    //   child: GridView.builder(
    //     physics: const PageScrollPhysics(),
    //     itemCount: properyData.length,
    //     shrinkWrap: true,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: grideCount,
    //       mainAxisSpacing: 8,
    //       crossAxisSpacing: 12,
    //       childAspectRatio: 0.8,
    //     ),
    //     itemBuilder: (context, index) {
    //       final property = properyData[index];
    //       return InkWell(
    //         onTap: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) {
    //                 return DetailPage(
    //                   propery: PropertyModel(
    //                     name: property.name,
    //                     price: property.price,
    //                     city: property.city,
    //                     address: property.address,
    //                     type: property.type,
    //                     instalment: property.instalment,
    //                     desc: property.desc,
    //                     developer: property.developer,
    //                     image: property.image,
    //                     bedroom: property.bedroom,
    //                     bathroom: property.bathroom,
    //                     area: property.area,
    //                   ),
    //                 );
    //               },
    //             ),
    //           );
    //         },
    //         child: ListPropertyWidget(
    //           name: property.name,
    //           price: property.price,
    //           city: property.city,
    //           image: property.image,
    //           type: property.type,
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}