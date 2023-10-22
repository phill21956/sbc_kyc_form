/* import 'package:flutter/material.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String stateValue = NigerianStatesAndLGA.allStates[0];
  String lgaValue = 'Select a Local Government Area';
  String selectedLGAFromAllLGAs = NigerianStatesAndLGA.getAllNigerianLGAs()[0];
  List<String> statesLga = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nigerian States and LGAs')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select a Nigerian state',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                  key: const ValueKey('States'),
                  value: stateValue,
                  isExpanded: true,
                  hint: const Text('Select a Nigerian state'),
                  items: NigerianStatesAndLGA.allStates
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (val) {
                    lgaValue = 'Select a Local Government Area';
                    statesLga.clear();
                    statesLga.add(lgaValue);
                    statesLga.addAll(NigerianStatesAndLGA.getStateLGAs(val!));
                    setState(() {
                      stateValue = val;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                  key: const ValueKey('Local governments'),
                  value: lgaValue,
                  isExpanded: true,
                  hint: const Text('Select a Lga'),
                  items:
                      statesLga.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      lgaValue = val!;
                    });
                  }),
            ]),
      ),
    );
  }
}
 */