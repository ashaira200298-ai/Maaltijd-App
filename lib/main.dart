import 'package:flutter/material.dart';

void main() {
  runApp(const MaaltijdApp());
}

class MaaltijdApp extends StatelessWidget {
  const MaaltijdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mijn Sfeervolle Maaltijd Planner',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFDFBF7), 
      ),
      home: const MaaltijdDashboard(),
    );
  }
}

class MaaltijdDashboard extends StatefulWidget {
  const MaaltijdDashboard({super.key});

  @override
  State<MaaltijdDashboard> createState() => _MaaltijdDashboardState();
}

class _MaaltijdDashboardState extends State<MaaltijdDashboard> {
  final double startGewicht = 78.0;
  final double streefGewicht = 65.0; 

  int _selectedTabIndex = 0; // 0 = Lunch, 1 = Diner

  final List<Map<String, String>> lunches = [
    {
      'title': 'Egg & Wasa Crackers',
      'ingredients': '2 gekookte eieren in schijfjes op donkere Wasa crackers, op smaak gebracht met een snufje zout en peper.',
    },
    {
      'title': 'Clean Tuna Rice Toss',
      'ingredients': 'Witte rijst gemengd met tonijn uit blik (in water) en een snuf knoflookpoeder. Simpel, clean en eiwitrijk.',
    },
    {
      'title': 'Warme Kip & Rijst Soep',
      'ingredients': 'Een lichte, heldere soep met stukjes malse kipfilet en een fijne portie witte rijst om warm mee te lunchen.',
    },
    {
      'title': 'Quick Fried Rice Lunch',
      'ingredients': 'Witte rijst kort omgeschept in de pan met 1 eitje, doperwtjes en een gefruit uitje.',
    },
    {
      'title': 'Kip & Courgette Couscous',
      'ingredients': 'Luchtige couscous met stukjes zelfgemaakte kipfilet en blokjes courgette, lekker gekruid.',
    },
    {
      'title': 'La Vache Qui Rit & Egg Toast',
      'ingredients': 'Brood of Wasa cracker met een klein glansje olijfolie, La Vache Qui Rit smeerkaas en een gekookt ei.',
    },
    {
      'title': 'Kikkererwten in Tomatensoep',
      'ingredients': 'Een kom warme, zelfgemaakte tomatensoep met een flinke hand kikkererwten erdoor voor de eiwitten.',
    },
    {
      'title': 'Chicken Spinach Pocket',
      'ingredients': 'Stukjes malse kipfilet met warme diepvriesspinazie en ui, gestopt in een pocketbroodje of wrap.',
    },
  ];

  final List<Map<String, String>> diners = [
    {
      'title': 'Homemade Chicken Rice Bowl',
      'ingredients': 'Malse stukjes kip (filet of poot), een goede portie witte rijst, doperwten en maïs als extra groente.',
    },
    {
      'title': 'Beef & Red Bean Rice',
      'ingredients': 'Rundergehakt (rul gebakken en vet afgegoten) met rode bonen, geserveerd over witte rijst.',
    },
    {
      'title': 'Visfilet uit de oven met Rijst',
      'ingredients': 'Pangasius- of zalmfilet lekker gekruid uit de oven, met witte rijst and een zachte spinaziesalade.',
    },
    {
      'title': 'Stevige Kippensoep met Rijst',
      'ingredients': 'Zelfgetrokken soep van kippenbout met doperwtjes and courgette, met een handje rijst meegekookt.',
    },
    {
      'title': 'Kip & Kikkererwten Tajine',
      'ingredients': 'Kipfilet en kikkererwten gestoofd in een warme tomaten-knoflooksaus, met couscous of rijst.',
    },
    {
      'title': 'Rundergehakt met Courgette & Rijst',
      'ingredients': 'Rundergehakt (vet afgegoten) gebakken met ui en veel blokjes courgette, gemengd door witte rijst.',
    },
    {
      'title': 'Triple Green Rice',
      'ingredients': 'Witte rijst geroerbakken met lekker veel spinazie, doperwten and courgette in knoflook, met een eitje.',
    },
    {
      'title': 'Loubia (Marokkaanse Witte Bonen)',
      'ingredients': 'Witte bonen in een heerlijke, dikke, warme tomatensaus met knoflook en kruiden. Heerlijk met rijst of kip.',
    },
  ];

  int? gekozenLunchIndex;
  int? gekozenDinerIndex;

  @override
  Widget build(BuildContext context) {
    final huidigeLijst = _selectedTabIndex == 0 ? lunches : diners;
    final isLunchTab = _selectedTabIndex == 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mijn Keuken Geluk', 
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF5C3D2E), letterSpacing: 0.5),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5EBE6), 
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: const Color(0xFFFFF8F3), 
                elevation: 2,
                shadowColor: const Color(0xFFE8D8CE).withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Color(0xFFC06C4C), width: 1.5), 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Mijn Doel & Voortgang',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF865439)),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildWeightInfo('Start', '$startGewicht kg'),
                          Container(width: 1, height: 30, color: const Color(0xFFC06C4C).withOpacity(0.3)), 
                          _buildWeightInfo('Streefniveau', '$streefGewicht kg'),
                          Container(width: 1, height: 30, color: const Color(0xFFC06C4C).withOpacity(0.3)),
                          _buildWeightInfo('Te verliezen', '12 - 15 kg'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                isLunchTab ? 'Wat gaan we maken voor de lunch?' : 'Wat schaft de pot vanavond?',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF5C3D2E)),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: huidigeLijst.length,
                itemBuilder: (context, index) {
                  final huidigeGekozenIndex = isLunchTab ? gekozenLunchIndex : gekozenDinerIndex;
                  final isSelected = huidigeGekozenIndex == index;
                  final weergaveNummer = index + 1;

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFF7E7E0) : Colors.white, 
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE8D8CE).withOpacity(isSelected ? 0.6 : 0.3),
                          blurRadius: isSelected ? 10 : 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(
                        color: const Color(0xFFC06C4C),
                        width: isSelected ? 2.5 : 1.5, 
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFC06C4C),
                        child: Text(
                          '$weergaveNummer',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        huidigeLijst[index]['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF865439)),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          huidigeLijst[index]['ingredients']!,
                          style: const TextStyle(color: Color(0xFF5C3D2E), fontSize: 14, height: 1.3),
                        ),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected ? const Color(0xFF8A7973) : const Color(0xFFC06C4C), 
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        ),
                        onPressed: () {
                          setState(() {
                            if (isLunchTab) {
                              gekozenLunchIndex = isSelected ? null : index;
                            } else {
                              gekozenDinerIndex = isSelected ? null : index;
                            }
                          });
                        },
                        child: Text(
                          isSelected ? 'Gekozen ✓' : 'Eet dit',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFC06C4C), 
        unselectedItemColor: const Color(0xFFB4A59F),
        backgroundColor: Colors.white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.lunch_dining_outlined),
            activeIcon: Icon(Icons.lunch_dining),
            label: 'Lunchmoment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_outlined), 
            activeIcon: Icon(Icons.restaurant),
            label: 'Dinertijd',
          ),
        ],
      ),
    );
  }

  Widget _buildWeightInfo(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF9E8476), fontSize: 12, fontWeight: FontWeight.w500)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF5C3D2E))),
      ],
    );
  }
}