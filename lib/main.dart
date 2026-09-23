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
    const ElmScannerScreen(),
    const AiDoctorScreen(), // AI Diagnostic Assistant
    const DtcLookupScreen(),
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
            icon: Icon(Icons.psychology_outlined),
            selectedIcon: Icon(Icons.psychology, color: Color(0xFF42A5F5)),
            label: 'AI Doctor',
          ),
          NavigationDestination(
            icon: Icon(Icons.build_outlined),
            selectedIcon: Icon(Icons.build, color: Color(0xFF42A5F5)),
            label: 'DTC Database',
          ),
        ],
      ),
    );
  }
}

// Home Screen
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
                            Icon(Icons.psychology, color: Colors.white, size: 16),
                            SizedBox(width: 6),
                            Text('AI Diagnostics Powered', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      const Icon(Icons.check_circle_outline, color: Colors.greenAccent),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Vehicle Status: Ready for Scan', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text('Ask AI Doctor to diagnose DTC fault codes or unusual engine symptoms.', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.auto_awesome, size: 18),
                    label: const Text('Consult AI Doctor'),
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
                _buildActionCard(icon: Icons.auto_graph, title: 'Live Telemetry', subtitle: 'MAF, Voltage, Fuel Trim', color: Colors.lightBlueAccent),
                _buildActionCard(icon: Icons.psychology, title: 'AI Assistant', subtitle: 'Smart Repair Guidance', color: Colors.purpleAccent),
                _buildActionCard(icon: Icons.history, title: 'Scan Logs', subtitle: 'Previous Reports', color: Colors.greenAccent),
              ],
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
}

// AI Doctor Screen
class AiDoctorScreen extends StatefulWidget {
  const AiDoctorScreen({super.key});

  @override
  State<AiDoctorScreen> createState() => _AiDoctorScreenState();
}

class _AiDoctorScreenState extends State<AiDoctorScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [
    {
      'sender': 'ai',
      'text': 'Hello! I am your AI Auto Doctor. Mention any DTC codes (e.g. P1101, P0446) or describe engine symptoms for an instant diagnosis.'
    }
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'sender': 'user', 'text': text});
      _messageController.clear();
    });

    // Simulate AI Diagnosis Response
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        String response = "I've analyzed your input. ";
        final upper = text.toUpperCase();

        if (upper.contains('P1101')) {
          response += "Code P1101 indicates Mass Air Flow (MAF) sensor intake airflow range error. "
              "\n\n🛠 Recommended Actions:"
              "\n1. Inspect MAF sensor for dust or oil contamination; clean using CRC MAF Cleaner."
              "\n2. Check intake duct hose for unmetered vacuum leaks."
              "\n3. Inspect air filter element and throttle body carbon buildup.";
        } else if (upper.contains('P0446')) {
          response += "Code P0446 indicates EVAP Vent Solenoid Valve Control Circuit error."
              "\n\n🛠 Recommended Actions:"
              "\n1. Check EVAP vent valve wiring and connector pins."
              "\n2. Verify charcoal canister for restriction."
              "\n3. Test vent solenoid coil resistance.";
        } else if (upper.contains('P3055') || upper.contains('P3056')) {
          response += "Code $upper relates to DC/DC Converter output voltage/current variance."
              "\n\n🛠 Recommended Actions:"
              "\n1. Measure auxiliary battery static and loaded voltage."
              "\n2. Inspect ground straps and high-current inline fuses.";
        } else {
          response += "Based on your description, check air intake flow, fuel delivery pressure, and battery ground connections. Run an OBD-II scan to get specific fault codes.";
        }

        setState(() {
          _messages.add({'sender': 'ai', 'text': response});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF1E1E1E),
            child: Row(
              children: const [
                CircleAvatar(
                  backgroundColor: Color(0xFF1E88E5),
                  child: Icon(Icons.psychology, color: Colors.white),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Auto Doctor AI Assistant', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Online | Diagnostic Model v2.4', style: TextStyle(color: Colors.greenAccent, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg['sender'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                    decoration: BoxDecoration(
                      color: isUser ? const Color(0xFF1E88E5) : const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(16),
                      border: isUser ? null : Border.all(color: Colors.white10),
                    ),
                    child: Text(
                      msg['text']!,
                      style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.4),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: const Color(0xFF1E1E1E),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Type symptom or code (e.g. P1101)...',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                      filled: true,
                      fillColor: const Color(0xFF121212),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send, color: Color(0xFF1E88E5)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ELM327 Bluetooth Scanner Screen
class ElmScannerScreen extends StatefulWidget {
  const ElmScannerScreen({super.key});

  @override
  State<ElmScannerScreen> createState() => _ElmScannerScreenState();
}

class _ElmScannerScreenState extends State<ElmScannerScreen> {
  bool isScanning = false;
  bool isConnected = false;
  String selectedDevice = "No device connected";

  void _startScan() {
    setState(() {
      isScanning = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isScanning = false;
        });
      }
    });
  }

  void _connectDevice(String deviceName) {
    setState(() {
      selectedDevice = deviceName;
      isConnected = true;
    });
  }

  void _disconnect() {
    setState(() {
      selectedDevice = "No device connected";
      isConnected = false;
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
            const Text('ELM327 OBD-II Scanner', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(isConnected ? 'Status: Connected to $selectedDevice' : 'Status: Disconnected', 
                style: TextStyle(color: isConnected ? Colors.greenAccent : Colors.redAccent, fontSize: 13, fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isScanning ? null : _startScan,
                icon: isScanning ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Icon(Icons.bluetooth_searching),
                label: Text(isScanning ? 'Scanning Devices...' : 'Scan for OBD-II Bluetooth'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E88E5),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Discovered Devices', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildDeviceTile("OBDII Bluetooth (ELM327 v1.5)", "00:1D:A5:68:C2:11"),
            _buildDeviceTile("VEEPEAK VP11", "11:22:33:AA:BB:CC"),
            _buildDeviceTile("vLinker MC+", "AA:BB:CC:44:55:66"),
            const SizedBox(height: 20),
            if (isConnected) ...[
              const Text('Live Telemetry (ECU Stream)', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                  children: [
                    _buildGaugeCard("Engine RPM", "780 RPM", Icons.speed, Colors.cyanAccent),
                    _buildGaugeCard("MAF Airflow", "3.4 g/s", Icons.air, Colors.greenAccent),
                    _buildGaugeCard("Coolant Temp", "88 °C", Icons.thermostat, Colors.orangeAccent),
                    _buildGaugeCard("Battery Volt", "14.2 V", Icons.electric_bolt, Colors.amberAccent),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _disconnect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent.withOpacity(0.2),
                  foregroundColor: Colors.redAccent,
                  side: const BorderSide(color: Colors.redAccent),
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Disconnect Adapter'),
              )
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceTile(String name, String mac) {
    bool isThisConnected = isConnected && selectedDevice == name;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: isThisConnected ? Border.all(color: Colors.greenAccent) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
              Text(mac, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            ],
          ),
          ElevatedButton(
            onPressed: isThisConnected ? null : () => _connectDevice(name),
            style: ElevatedButton.styleFrom(
              backgroundColor: isThisConnected ? Colors.green : const Color(0xFF2C2C2C),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(isThisConnected ? 'Connected' : 'Connect', style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildGaugeCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 6),
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
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
          'desc': 'This DTC code is not present in the local offline database.',
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
                        const Text('Possible Causes:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
