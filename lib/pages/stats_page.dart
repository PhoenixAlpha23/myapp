import 'package:flutter/material.dart';

void main() {
  runApp(CarbonEmissionApp());
}

class CarbonEmissionApp extends StatelessWidget {
  const CarbonEmissionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarbonEmissionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CarbonEmissionPage extends StatelessWidget {
  final double emissionValue = 30.0; // Dynamic value for today's emissions
  final double maxEmission = 100.0; // For rank bar adaptation

  @override
  Widget build(BuildContext context) {
    double progress = (emissionValue / maxEmission).clamp(0.0, 1.0); // Cap between 0 and 1

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rank Bar at Top Right
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Rank Progress",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 6,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade300,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: progress,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: const LinearGradient(
                                colors: [Colors.green, Colors.red],
                                stops: [0.0, 1.0],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              // Heading: Today's Emissions
              const Text(
                "Today's CO₂ Emission",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const SizedBox(height: 10),

              // Dynamic Emission Value Display
              Center(
                child: Text(
                  "${emissionValue.toStringAsFixed(1)} g CO₂/km",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Subtle Emission Progress Bar
              Center(
                child: Column(
                  children: [
                    Text(
                      "Today's Emission Progress",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 6,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade300,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: progress,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(
                                colors: [Colors.green, Colors.red],
                                stops: [0.0, 1.0],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // Emissions Summary Section
              Text(
                "Total Emissions",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              SizedBox(height: 10),
              _summaryRow("Today:", "30.0 g CO₂/km"),
              _summaryRow("This Week:", "150.0 g CO₂/km"),
              _summaryRow("Predicted Emissions:", "200.0 g CO₂/km"),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for summary rows
  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
