import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _weightctrl = TextEditingController();
  final _heightctrl = TextEditingController();
  double bmi = 0;

  void bmicalc() {
    int w = int.parse(_weightctrl.text);
    int h = int.parse(_heightctrl.text);

    setState(() {
      var b = (w / pow(h / 100, 2));
      bmi = num.parse(b.toStringAsFixed(3)) as double;
    });
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => ResultPage(bmi: bmi),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 116, 47),
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 47, 206, 84),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Enter weight in kg",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "weight",
                      ),
                      controller: _weightctrl,
                      keyboardType: TextInputType.number,
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 47, 206, 84),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Enter height in cm",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "height",
                      ),
                      controller: _heightctrl,
                      keyboardType: TextInputType.number,
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  bmicalc();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 31, 158, 242)),
                ),
                child: Text(
                  "Calculate",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 18,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final double bmi;
  const ResultPage({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 116, 47),
      appBar: AppBar(
        title: Text(
          "BMI Result",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your BMI is:",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "$bmi",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          bmi < 18.4
              ? Text("Underweight",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.red,
                  ))
              : const Center(),
          bmi > 18.4 && bmi < 24.9
              ? Text("Normal",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ))
              : const Center(),
          bmi > 24.9
              ? Text(
                  "Overweight",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.red,
                  ),
                )
              : const Center(),
        ],
      )),
    );
  }
}
