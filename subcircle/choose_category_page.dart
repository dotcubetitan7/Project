import 'package:flutter/material.dart';
import 'package:post/common_widgets/custom_button.dart';
import 'package:post/view/auth/login_screen/pop_up_subscription.dart';

class CategorySection {
  final String title;
  final List<Map<String, String>> items;

  CategorySection({required this.title, required this.items});
}

class ChooseCategoryPage extends StatefulWidget {
  const ChooseCategoryPage({super.key});

  @override
  State<ChooseCategoryPage> createState() => _ChooseCategoryPageState();
}

class _ChooseCategoryPageState extends State<ChooseCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  final Set<String> selectedItems = {};

  LinearGradient get _mainGradient => const LinearGradient(
        colors: [Color(0xff02447F), Color(0xff000427)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  final List<CategorySection> sections = [
    CategorySection(title: "Lifestyle & Personal", items: [
      {"title": "Vlogging / Daily Life", "image": "assets/vloging.png"},
      {"title": "Travel & Adventure", "image": "assets/travel.png"},
      {"title": "Personal Finance", "image": "assets/finance.png"},
      {"title": "Family & Parenting", "image": "assets/family.png"},
      {"title": "Minimalism / Home", "image": "assets/home.png"},
    ]),
    CategorySection(title: "Health & Self-Improvement", items: [
      {"title": "Fitness & Wellness", "image": "assets/tribute.png"},
      {"title": "Mental Health", "image": "assets/family.png"},
      {"title": "Personal Finance", "image": "assets/finance.png"},
      {"title": "Self-Care & Beauty", "image": "assets/home.png"},
    ]),
    CategorySection(title: "Creative & Entertainment", items: [
      {"title": "Music & Performance", "image": "assets/finance.png"},
      {"title": "Art & Design", "image": "assets/home.png"},
      {"title": "Gaming & Esports", "image": "assets/round.png"},
      {"title": "Film / TV / Pop", "image": "assets/singer.png"},
      {"title": "Fashion & Style", "image": "assets/photoshop.png"},
    ]),
    CategorySection(title: "Niche & Community", items: [
      {"title": "Activism & Social", "image": "assets/family.png"},
      {"title": "Spirituality & Faith", "image": "assets/singer.png"},
      {"title": "Cars & Automotive", "image": "assets/photoshop.png"},
      {"title": "Sports & Outdoors", "image": "assets/travel.png"},
      {"title": "Pets & Animals", "image": "assets/tribute.png"},
    ]),
  ];

  Widget buildCategory(BuildContext context, String title, String image) {
    final bool isSelected = selectedItems.contains(title);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedItems.remove(title);
          } else {
            selectedItems.add(title);
          }
        });
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.red : Colors.transparent,
                width: 3,
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 6),

          Text(
            title,
            textAlign: TextAlign.center,
            style: 
            TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget buildSection(BuildContext context, CategorySection section) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              section.title,
              style:
               TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: section.items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final item = section.items[index];
              return buildCategory(context, item["title"]!, item["image"]!);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: _mainGradient),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Choose categories you like",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...sections.map((sec) => buildSection(context, sec)),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 45,
                      child: CustomButton(
                        text: "Next Page",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SubscriptionPopup(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
