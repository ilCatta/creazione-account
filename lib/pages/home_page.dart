import 'package:creazione_account/components/registration_section.dart';
import 'package:creazione_account/components/registration_text_field.dart';
import 'package:flutter/material.dart';

enum Sex {
  male,
  female,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Sex? sex;
  double ral = 0;
  bool termsAndConditionAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            header(),
            body(),
          ],
        ),
      ),
    );
  }

  Widget header() => Image.network(
        'https://images.unsplash.com/photo-1580508174046-170816f65662?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"',
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      );

  Widget body() => Positioned(
        top: 190,
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RegistrationSection(
                  title: 'il tuo nome',
                  child: RegistrationTextField(
                    hintText: 'Inserisci nome e congome',
                  ),
                ),
                SizedBox(height: 10),
                RegistrationSection(
                  title: 'la tua età',
                  child: RegistrationTextField(
                    hintText: 'Inserisci età',
                    keyboardType: TextInputType.number,
                  ),
                ),
                RegistrationSection(
                  title: 'sesso',
                  child: Column(
                    children: [
                      RadioListTile<Sex>(
                        title: Text('Uomo'),
                        value: Sex.male,
                        groupValue: sex,
                        onChanged: (value) => setState(() => sex = value),
                      ),
                      RadioListTile<Sex>(
                        title: Text('Donna'),
                        value: Sex.female,
                        groupValue: sex,
                        onChanged: (value) => setState(() => sex = value),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RegistrationSection(
                  title: 'ral',
                  child: Slider(
                    value: ral,
                    min: 0,
                    max: 100000,
                    divisions: 1000,
                    thumbColor: Colors.pink,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.pink.shade100,
                    label: '${(ral / 1000).round()}k',
                    onChanged: (value) => setState(() => ral = value),
                  ),
                ),
                SizedBox(height: 10),
                RegistrationSection(
                  title: 'termini e condizioni d\'uso',
                  child: SwitchListTile(
                    title: Text(
                        termsAndConditionAccepted ? 'Accetto' : 'Non Accetto'),
                    value: termsAndConditionAccepted,
                    activeColor: Colors.pink,
                    onChanged: (value) =>
                        setState(() => termsAndConditionAccepted = value),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(
                        double.infinity,
                        50,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.pink.shade400,
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  child: Text('Crea account'),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      );
}
