import 'package:flutter/material.dart';

void main() {
  runApp(const AutoDoctorApp());
}

class AutoDoctorApp extends StatelessWidget {
  const AutoDoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Doctor AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('OBD-II Scanner & Live Data', style: TextStyle(color: Colors.white, fontSize: 18))),
    const DtcLookupScreen(),
    const Center(child: Text('Settings & Configuration', style: TextStyle(color: Colors.white, fontSize: 18))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF1E1E1E),
        indicatorColor: const Color(0xFF1E88E5).withOpacity(0.3),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color(0xFF42A5F5)),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.bluetooth_searching),
            selectedIcon: Icon(Icons.bluetooth_connected, color: Color(0xFF42A5F5)),
            label: 'Scanner',
          ),
          NavigationDestination(
            icon: Icon(Icons.build_outlined),
            selectedIcon: Icon(Icons.build, color: Color(0xFF42A5F5)),
            label: 'DTC Lookup',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings, color: Color(0xFF42A5F5)),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back 👋', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    SizedBox(height: 4),
                    Text('Auto Doctor AI', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: const Color(0xFF2C2C2C)),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Vehicle Status Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1565C0), Color(0xFF1E88E5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                        child: const Row(
                          children: [
                            Icon(Icons.directions_car, color: Colors.white, size: 16),
                            SizedBox(width: 6),
                            Text('Active System', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      const Icon(Icons.check_circle_outline, color: Colors.greenAccent),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Vehicle Health: Good', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text('Engine & EVAP diagnostics operating within normal parameters.', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.search, size: 18),
                    label: const Text('Start Full Scan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1565C0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Quick Actions
            const Text('Quick Actions', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                _buildActionCard(icon: Icons.qr_code_scanner, title: 'OBD-II Scan', subtitle: 'Read Diagnostic Codes', color: Colors.orangeAccent),
                _buildActionCard(icon: Icons.auto_graph, title: 'Live Data', subtitle: 'MAF, Voltage, Fuel Trim', color: Colors.lightBlueAccent),
                _buildActionCard(icon: Icons.history, title: 'Scan Logs', subtitle: 'Previous Reports', color: Colors.greenAccent),
                _buildActionCard(icon: Icons.build_circle_outlined, title: 'Cross Parts', subtitle: 'OEM Part Compatibility', color: Colors.purpleAccent),
              ],
            ),
            const SizedBox(height: 24),

            // System Logs
            const Text('Recent Diagnostics', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildLogItem(title: 'MAF Sensor Stream', status: 'In Range (No P1101)', icon: Icons.verified, color: Colors.green),
                  const Divider(color: Colors.white10),
                  _buildLogItem(title: 'EVAP Purge Test', status: 'Passed (No P0446)', icon: Icons.verified, color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildActionCard({required IconData icon, required String title, required String subtitle, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(backgroundColor: color.withOpacity(0.15), radius: 20, child: Icon(icon, color: color, size: 22)),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 2),
          Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  static Widget _buildLogItem({required String title, required String status, required IconData icon, required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
                Text(status, style: const TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// DTC Lookup Screen
class DtcLookupScreen extends StatefulWidget {
  const DtcLookupScreen({super.key});

  @override
  State<DtcLookupScreen> createState() => _DtcLookupScreenState();
}

class _DtcLookupScreenState extends State<DtcLookupScreen> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, dynamic>? _selectedCodeData;

  final Map<String, Map<String, dynamic>> _dtcDatabase = {
    'P0446': {
      'title': 'EVAP Vent Control Circuit Malfunction',
      'system': 'Evaporative Emission System',
      'desc': 'An improper voltage signal has been detected from the EVAP vent valve control circuit.',
      'causes': [
        'Faulty EVAP vent solenoid valve',
        'Damaged, shorted, or corroded wiring/connectors',
        'Restricted/clogged EVAP charcoal canister',
        'Loose or defective fuel cap'
      ],
      'severity': 'Moderate',
    },
    'P1101': {
      'title': 'MAF Sensor Out of Self-Test Range',
      'system': 'Air Intake / MAF System',
      'desc': 'Mass Air Flow (MAF) sensor signal voltage output is outside expected operational range during internal self-test.',
      'causes': [
        'Dirty or contaminated MAF sensor element',
        'Unmetered air leaks (Vacuum leak / Intake boot crack)',
        'Clogged air filter element',
        'Carbon buildup on throttle body plate'
      ],
      'severity': 'Moderate-High',
    },
    'P3055': {
      'title': 'DC/DC Converter Output Voltage Low',
      'system': 'Power Conversion System',
      'desc': 'The primary DC/DC power converter module output voltage has dropped below the minimum calibrated threshold.',
      'causes': [
        'Weak or degraded auxiliary battery (12V)',
        'Internal DC/DC power module fault',
        'Loose, high-resistance, or corroded ground strap',
        'Blown inline high-current fuse'
      ],
      'severity': 'High',
    },
    'P3056': {
      'title': 'DC/DC Converter Output Current Performance',
      'system': 'Power Distribution System',
      'desc': 'The output current feedback sensor signal for the DC/DC converter module is out of specification.',
      'causes': [
        'Current sensor degradation',
        'Short circuit in primary power distribution rail',
        'Main battery voltage collapse under load'
      ],
      'severity': 'High',
    },
  };

  void _searchCode(String code) {
    final cleanCode = code.trim().toUpperCase();
    setState(() {
      if (_dtcDatabase.containsKey(cleanCode)) {
        _selectedCodeData = Map<String, dynamic>.from(_dtcDatabase[cleanCode]!);
        _selectedCodeData!['code'] = cleanCode;
      } else {
        _selectedCodeData = {
          'code': cleanCode,
          'title': 'Custom Code / Not In Standard Database',
          'system': 'General OBD-II',
          'desc': 'This DTC code is not present in the local offline database. Connect AI Diagnostic Agent or OEM database to analyze.',
          'causes': ['Manufacturer specific code or unlisted DTC.'],
          'severity': 'Unknown',
        };
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('DTC Lookup & Analysis', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text('Enter DTC fault code (e.g., P0446, P1101, P3055):', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: 'e.g., P1101',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFF1E1E1E),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                      prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _searchCode(_searchController.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E88E5),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Search', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['P0446', 'P1101', 'P3055', 'P3056'].map((code) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ActionChip(
                      label: Text(code, style: const TextStyle(color: Colors.white)),
                      backgroundColor: const Color(0xFF2C2C2C),
                      onPressed: () {
                        _searchController.text = code;
                        _searchCode(code);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedCodeData != null) ...[
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_selectedCodeData!['code'], style: const TextStyle(color: Colors.orangeAccent, fontSize: 24, fontWeight: FontWeight.bold)),
                            Chip(
                              label: Text(_selectedCodeData!['severity'], style: const TextStyle(color: Colors.white, fontSize: 11)),
                              backgroundColor: Colors.redAccent.withOpacity(0.3),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(_selectedCodeData!['title'], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text('System: ${_selectedCodeData!['system']}', style: const TextStyle(color: Colors.lightBlueAccent, fontSize: 12)),
                        const Divider(color: Colors.white10, height: 24),
                        const Text('Description:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(_selectedCodeData!['desc'], style: const TextStyle(color: Colors.white70, fontSize: 13)),
                        const SizedBox(height: 16),
                        const Text('Possible Causes & Symptoms:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        ...(_selectedCodeData!['causes'] as List<String>).map((cause) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle_outline, color: Colors.greenAccent, size: 14),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(cause, style: const TextStyle(color: Colors.white70, fontSize: 12))),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
