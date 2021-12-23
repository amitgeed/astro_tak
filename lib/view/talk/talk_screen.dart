import 'package:astro_tak/provider/talk_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TalkScreen extends StatefulWidget {
  const TalkScreen({Key? key}) : super(key: key);

  @override
  _TalkScreenState createState() => _TalkScreenState();
}

class _TalkScreenState extends State<TalkScreen> {
  @override
  void initState() {
    super.initState();
    final talkProvider = Provider.of<TalkProvider>(context, listen: false);
    talkProvider.selectedLangs.clear();
    talkProvider.selectedSkills.clear();
    talkProvider.selectedSortType = SortType.CLR;
    talkProvider.getAstrologersList();
  }

  @override
  Widget build(BuildContext context) {
    final talkProvider = Provider.of<TalkProvider>(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: talkProvider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Talk to an Astrologer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              talkProvider.toggleSearch();
                            },
                            child: Image.asset(
                              'assets/logos/search.png',
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          PopupMenuButton(
                            icon: Image.asset(
                              'assets/logos/filter.png',
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry>[
                              PopupMenuItem(child: Text('Filter by Skill')),
                              PopupMenuDivider(),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedLangs
                                        .contains('Hindi'),
                                    title: Text('Hindi'),
                                    onChanged: (val) {
                                      provider.toggleLangs(
                                          'Hindi', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedLangs
                                        .contains('English'),
                                    title: Text('English'),
                                    onChanged: (val) {
                                      provider.toggleLangs(
                                          'English', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(child: Text('Filter by Skill')),
                              PopupMenuDivider(),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedSkills
                                        .contains('Kundali Grah Dosh'),
                                    title: Text('Kundali Grah Dosh'),
                                    onChanged: (val) {
                                      provider.toggleSkills(
                                          'Kundali Grah Dosh', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedSkills
                                        .contains('Vedic Astrology'),
                                    title: Text('Vedic Astrology'),
                                    onChanged: (val) {
                                      provider.toggleSkills(
                                          'Vedic Astrology', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedSkills
                                        .contains('Numerology'),
                                    title: Text('Numerology'),
                                    onChanged: (val) {
                                      provider.toggleSkills(
                                          'Numerology', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedSkills
                                        .contains('Vastu'),
                                    title: Text('Vastu'),
                                    onChanged: (val) {
                                      provider.toggleSkills(
                                          'Vastu', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedSkills
                                        .contains('Astrology'),
                                    title: Text('Astrology'),
                                    onChanged: (val) {
                                      provider.toggleSkills(
                                          'Astrology', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedSkills
                                        .contains('Falit Jyotish'),
                                    title: Text('Falit Jyotish'),
                                    onChanged: (val) {
                                      provider.toggleSkills(
                                          'Falit Jyotish', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedSkills
                                        .contains('Palmistry'),
                                    title: Text('Palmistry'),
                                    onChanged: (val) {
                                      provider.toggleSkills(
                                          'Palmistry', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedSkills
                                        .contains('Face Reading'),
                                    title: Text('Face Reading'),
                                    onChanged: (val) {
                                      provider.toggleSkills(
                                          'Face Reading', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedSkills
                                        .contains('Tarot'),
                                    title: Text('Tarot'),
                                    onChanged: (val) {
                                      provider.toggleSkills(
                                          'Tarot', context);
                                    },
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Consumer<TalkProvider>(
                                  builder: (ctx, provider, _) =>
                                      CheckboxListTile(
                                    value: talkProvider.selectedSkills
                                        .contains('Coffe Cup Reading'),
                                    title: Text('Coffe Cup Reading'),
                                    onChanged: (val) {
                                      provider.toggleSkills(
                                          'Coffe Cup Reading', context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          PopupMenuButton(
                            icon: Image.asset(
                              'assets/logos/sort.png',
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry>[
                              PopupMenuItem(
                                child: Text(
                                  'Sort by',
                                  style: TextStyle(
                                    color: Colors.orange,
                                  ),
                                ),
                                value: SortType.CLR,
                              ),
                              PopupMenuDivider(),
                              PopupMenuItem(
                                child: RadioListTile<SortType>(
                                  value: SortType.E1,
                                  groupValue: talkProvider.selectedSortType,
                                  onChanged: (SortType? val) {
                                    talkProvider.selectSortType(val!, context);
                                  },
                                  title: Text('Experience- high to low'),
                                ),
                              ),
                              PopupMenuItem(
                                child: RadioListTile<SortType>(
                                  value: SortType.E2,
                                  groupValue: talkProvider.selectedSortType,
                                  onChanged: (SortType? val) {
                                    talkProvider.selectSortType(val!, context);
                                  },
                                  title: Text('Experience- low to high'),
                                ),
                              ),
                              PopupMenuItem(
                                child: RadioListTile<SortType>(
                                  value: SortType.P1,
                                  groupValue: talkProvider.selectedSortType,
                                  onChanged: (SortType? val) {
                                    talkProvider.selectSortType(val!, context);
                                  },
                                  title: Text('Price- high to low'),
                                ),
                              ),
                              PopupMenuItem(
                                child: RadioListTile<SortType>(
                                  value: SortType.P2,
                                  groupValue: talkProvider.selectedSortType,
                                  onChanged: (SortType? val) {
                                    talkProvider.selectSortType(val!, context);
                                  },
                                  title: Text('Price- low to high'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: talkProvider.isSearchVisible,
                  child: Card(
                    child: TextField(
                      controller: talkProvider.searchController,
                      onChanged: (val) {
                        talkProvider.searchAstrologer();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: 'Search Astrologer',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            talkProvider.searchController.clear();
                            talkProvider.searchAstrologer();
                          },
                          child: Icon(Icons.clear),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: talkProvider.astrosList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    talkProvider.astrosList[index].images!
                                            .medium!.imageUrl ??
                                        'https://3.imimg.com/data3/YS/EF/MY-9267179/free-astrologer-consultancy-services-500x500.jpg',
                                    width: MediaQuery.of(context).size.width *
                                        0.23,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${talkProvider.astrosList[index].firstName} ${talkProvider.astrosList[index].lastName}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        IconsDetailsWidget(
                                          icon: Icons.psychology_outlined,
                                          text: talkProvider.listToString(
                                              talkProvider
                                                  .astrosList[index].skills!),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        IconsDetailsWidget(
                                            icon: Icons.translate,
                                            text: talkProvider.listToString(
                                                talkProvider.astrosList[index]
                                                    .languages!)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        IconsDetailsWidget(
                                          icon: Icons.card_membership_outlined,
                                          text: talkProvider.astrosList[index]
                                                  .additionalPerMinuteCharges!
                                                  .toInt()
                                                  .toString() +
                                              "/ Min",
                                          isBold: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(talkProvider
                                            .astrosList[index].experience
                                            .toInt()
                                            .toString() +
                                        ' Years'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                visible:
                                    !talkProvider.astrosList[index].isOnCall!,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color?>(
                                              Colors.orange[700]),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry?>(
                                        EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.call_outlined),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Take on Call'),
                                      ],
                                    )),
                              )
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

class IconsDetailsWidget extends StatelessWidget {
  IconsDetailsWidget({
    this.icon,
    this.text,
    this.isBold = false,
  });

  final String? text;
  final IconData? icon;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.orange,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            text ?? '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold! ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
