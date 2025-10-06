import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:post/view/auth/dashboard/custom_bottom_navigation_bar.dart';
import 'package:post/view/auth/dashboard/discover_page.dart';
import 'package:post/view/auth/dashboard/profile_page.dart';

class Product {
  final String image;
  final String title;
  final String price;
  final String oldPrice;
  final String discount;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });
}

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final String oldPrice;
  final String discount;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000427),
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(image, fit: BoxFit.cover, height: 250),
            ),
            SizedBox(height: 20),
            Text(title,
                style: 
                  TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(price,
                    style: 
                      TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent)),
                SizedBox(width: 10),
                Text(oldPrice,
                    style: 
                      TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough)),
                SizedBox(width: 10),
                Text(discount,
                    style: 
                      TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Category Detail Page
class CategoryDetailPage extends StatelessWidget {
  final String title;

  const CategoryDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000427),
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Text(
          "Welcome to $title category",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  final List<String> imgList = [
    "https://wallpaperaccess.com/full/112722.jpg",
    "https://tse1.mm.bing.net/th/id/OIP.YWqPn8iX5L40UOg8w0kWOwHaEo?w=2560&h=1600&rs=1&pid=ImgDetMain&o=7&rm=3",
    "https://media.istockphoto.com/photos/retro-blog-bookshelf-with-cozy-interior-picture-id1146554418?b=1&k=20&m=1146554418&s=170667a&w=0&h=OKcK6RlNkwYU4y1xba-hEcXM3IA7itp2pYKDGDT6KAI=",
    "https://i.etsystatic.com/48317150/r/il/e41917/5675719254/il_1140xN.5675719254_b4ac.jpg",
    "https://th.bing.com/th/id/OIP.G37tgeQqSNt7v2oPfj9ltQHaE7?w=286&h=191&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
  ];

  final List<Product> products = [
    Product(
      image:
          "https://tse3.mm.bing.net/th/id/OIP.B6-gbShuSqj73vK6rSCZewHaFj?rs=1&pid=ImgDetMain&o=7&rm=3",
      title: "Men's Dark Grey Introve...",
      price: "\$80",
      oldPrice: "\$100",
      discount: "20% Off",
    ),
    Product(
      image:
          "https://i.etsystatic.com/21854381/r/il/1afd5c/3096574823/il_1080xN.3096574823_af4z.jpg",
      title: "Men's Dark Grey Suit...",
      price: "\$80",
      oldPrice: "\$100",
      discount: "20% Off",
    ),
    Product(
      image:
          "https://th.bing.com/th/id/OIP.M-ZopqfIBRSGJfvvJgMqQwHaLH?w=204&h=306&c=7&r=0&o=5&dpr=1.3&pid=1.7",
      title: "Wireless Gaming Headset",
      price: "\$80",
      oldPrice: "\$100",
      discount: "20% Off",
    ),
    Product(
      image:
          "https://th.bing.com/th/id/OIP.caSE210H7Fqw9DlJ7Ewk-wHaIi?w=173&h=199&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
      title: "Portable Speaker",
      price: "\$80",
      oldPrice: "\$100",
      discount: "20% Off",
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_pages.isEmpty) {
      _pages.addAll([
        _buildHomeContent(),
        DiscoverPage(),
        ProfilePage(),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000427),
      body: SafeArea(
        child: Stack(
          children: [
            _pages[_selectedIndex],
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: CustomBottomNavigationBar(
                  selectedIndex: _selectedIndex,
                  onTabSelected: (index) {
                    setState(() => _selectedIndex = index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Container(
      width: width,
      height: height,
      decoration: 
        BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF02447F), Color(0xFF000427)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: height * 0.15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.02),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/Frame.png',
                    width: width * 0.25,
                    height: height * 0.07,
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications_none,
                          color: Colors.white, size: width * 0.07),
                      SizedBox(width: width * 0.04),
                      Icon(Icons.shopping_cart_outlined,
                          color: Colors.white, size: width * 0.07),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.015),

            // 🔹 Carousel (Recommended For You)
            CarouselSlider(
              items: imgList
                  .map(
                    (item) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(
                              title: "Recommended Product",
                              image: item,
                              price: "\$120",
                              oldPrice: "\$150",
                              discount: "20% Off",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(width * 0.015),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(item),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: height * 0.20,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 18 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 600),
                viewportFraction: 0.7,
              ),
            ),
            SizedBox(height: height * 0.03),

            // 🔹 Bottom White Container
            Container(
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(5, 15, 12, 0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Trending Creators
                  Text(
                    "#TRENDING CREATORS",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCreator("assets/beast.png"),
                        _buildCreator("assets/elvish.png"),
                        _buildCreator("assets/joy.png"),
                        _buildCreator("assets/karan.png"),
                        _buildCreator("assets/indian.png"),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Categories
                   Text(
                    "#CATEGORIES",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCategoryCard(
                            context, "assets/fashion_beauty.png", "Fashion & Beauty"),
                        _buildCategoryCard(
                            context, "assets/fashion_beauty.png", "Fitness & Wellness"),
                        _buildCategoryCard(
                            context, "assets/finance.png", "Tech & Gadgets"),
                        _buildCategoryCard(
                            context, "assets/fashion_beauty.png", "Finance & Business"),
                        _buildCategoryCard(context, "assets/finance.png", "Food"),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // From Categories You Like
                  Text(
                    "From Categories You Like",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return _buildProductCard(product);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreator(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blueAccent,
          width: 3,
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CategoryDetailPage(title: title)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 142,
        width: 104,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fitHeight,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(
              title: product.title,
              image: product.image,
              price: product.price,
              oldPrice: product.oldPrice,
              discount: product.discount,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: 
                        TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(product.price,
                          style: 
                           TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(width: 6),
                      Text(product.oldPrice,
                          style: 
                            TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12)),
                      SizedBox(width: 6),
                      Text(product.discount,
                          style: 
                            TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ],
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
