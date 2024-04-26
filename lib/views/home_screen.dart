import 'package:armyapp/views/aboutus_screen.dart';
import 'package:armyapp/views/branch_screen.dart';
import 'package:armyapp/views/contact_screen.dart';
import 'package:armyapp/views/faq_screen.dart';
import 'package:armyapp/views/service_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Product {
  final String title;
  final String imageUrl;

  Product({
    required this.title,
    required this.imageUrl,
  });
}

List<Product> homeItems = [
  Product(
    title: 'About us',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/32/32175.png',
  ),
  Product(
    title: 'Service',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/9321/9321345.png',
  ),
  Product(
    title: 'Map',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/235/235861.png',
  ),
  Product(
    title: 'Contact',
    imageUrl:
        'https://png.pngtree.com/png-vector/20230213/ourmid/pngtree-circle-phone-call-icon-in-black-color-png-image_6596895.png',
  ),
  Product(
    title: 'Branch',
    imageUrl: 'https://cdn-icons-png.flaticon.com/512/6577/6577251.png',
  ),
  Product(
    title: 'FAQ',
    imageUrl: 'https://cdn-icons-png.freepik.com/512/4403/4403555.png',
  ),
];

final List<String> homeItemsImage = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAKRBhdBzf2ZjYEv7Wr6ZVfKFGJeMz2tdRWQjinAZ7vA&s',
  'https://media.istockphoto.com/id/1328102406/photo/roup-of-soldiers-in-camouflage-military-uniforms-with-weapon-combs-through-area.jpg?s=612x612&w=0&k=20&c=UsI8t98WvUxmIMGMxhcCGAOwjZtE2VZtskqTLWbMTIU=',
  'https://media.istockphoto.com/id/604361668/photo/all-for-one-one-for-all.jpg?s=612x612&w=0&k=20&c=UdmK6MktqI_Y8Dy3MaaXhMy0w-Npt4WKqeAQKRZDXks=',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOXVEFfsiuJsLzGnKLcD0ODos0e_HUCZwmvM5WFrCB9Q&s',
  'https://live.staticflickr.com/65535/49470649246_52f6e8a00b_o.png',
  'https://d1ldvf68ux039x.cloudfront.net/thumbs/photos/2311/8139485/1000w_q95.jpg'
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.i2Xyg2lc5voJPtGXRfvFMwHaFk?w=217&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        50.0), // Adjust the border radius as needed
                    child: Image.asset(
                      'assets/salute.png', // Replace this with your image path
                      height: 80.0,
                    ),
                  ),
                  Container(child: const SizedBox(height: 10)),
                  const Text('Army Training',
                      style: TextStyle(color: Colors.white)),
                  Container(child: const SizedBox(height: 10)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.military_tech),
              title: const Text('Service'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ServiceScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_city_sharp),
              title: const Text('Branch'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BranchScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Contact'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ContactScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Map'),
              onTap: () {
                print("Hello Map");
                launchUrlString(
                    "https://www.google.com/maps/place/SALUTE+GORKHA+POKHARA/@28.1958413,84.0178941,17z/data=!3m1!4b1!4m6!3m5!1s0x399595b81b3ff851:0x89f96f6d5504eed2!8m2!3d28.1958366!4d84.020469!16s%2Fg%2F11c55vy_jc?entry=ttu");
              },
              // onTap: () {Navigator.of(context).push(
              //           MaterialPageRoute(
              //               builder: (context) => MapScreen()),
              //         );},
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('FAQ'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const FAQScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About us'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.call,
                    color: Colors.white), // Add your desired icon here
                onPressed: () {
                  launchUrlString("tel:+9779805832889");
                },
              ),
            ],
          ),
        ],
        foregroundColor: Colors.white,
        title: const Text(
          'Welcome to Army Training app',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 9 / 4,
              viewportFraction: 0.5,
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
            items: homeItemsImage.map((item) {
              return AspectRatio(
                aspectRatio: 9 / 4,
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
          const ListTile(
            title: Text(
              "Explore More",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
              ),
              itemCount: homeItems.length,
              itemBuilder: (BuildContext context, int index) {
                final product = homeItems[index];
                return GestureDetector(
                  onTap: () {
                    if (homeItems[index].title == "About us") {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AboutUsScreen()),
                      );
                    } else if (homeItems[index].title == "Service") {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ServiceScreen()),
                      );
                    } else if (homeItems[index].title == "Contact") {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ContactScreen()),
                      );
                    } else if (homeItems[index].title == "FAQ") {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const FAQScreen()),
                      );
                    } else if (homeItems[index].title == "Branch") {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BranchScreen()),
                      );
                    } else if (homeItems[index].title == "Map") {
                      launchUrlString(
                          "https://www.google.com/maps/place/SALUTE+GORKHA+POKHARA/@28.1958413,84.0178941,17z/data=!3m1!4b1!4m6!3m5!1s0x399595b81b3ff851:0x89f96f6d5504eed2!8m2!3d28.1958366!4d84.020469!16s%2Fg%2F11c55vy_jc?entry=ttu");
                    }
                  },
                  child: Card(
                    color: const Color.fromARGB(255, 207, 235, 162),
                    child: Column(
                      children: [
                        Flexible(
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover, // Constrain the image
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.title,
                            textAlign: TextAlign.center, // Center the text
                            style: const TextStyle(
                              fontSize:
                                  20.0, // Adjust the font size as necessary
                              overflow: TextOverflow
                                  .ellipsis, // Add ellipsis for long text
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
