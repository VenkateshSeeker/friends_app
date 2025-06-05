import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:project/home_screen/widgets/profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardSwiperController controller = CardSwiperController();

  final List<Profile> profiles = [
    Profile(
      name: "Mari",
      age: 26,
      distance: 7.0,
      imageUrl: "https://picsum.photos/200/300?random=1",
    ),
    Profile(
      name: "John",
      age: 29,
      distance: 5.2,
      imageUrl: "https://picsum.photos/200/300?random=2",
    ),
    Profile(
      name: "Lina",
      age: 24,
      distance: 3.1,
      imageUrl: "https://picsum.photos/200/300?random=3",
    ),
  ];


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint('The card $currentIndex was undod from the ${direction.name}');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff000000),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: profiles.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(0, -51),
                //  padding: const EdgeInsets.all(14.0),
                cardBuilder:
                    (
                      context,
                      index,
                      horizontalThresholdPercentage,
                      verticalThresholdPercentage,
                    ) {
                      return ProfileCard(profile: profiles[index]);
                    },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
