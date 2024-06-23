import 'package:flutter/material.dart';
import 'package:medical/ui/home_screen/tabs/splization_tab/spsialization_num_1.dart';
import 'package:page_transition/page_transition.dart';

class SpilizationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spilization'),
        toolbarHeight: 100,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/icons/back1.png"),
              ),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 89, 138, 128),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: SpsializationNumberOne()));
                    },
                    child: _buildServiceCard('Cardiology ')),
                SizedBox(width: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: SpsializationNumberOne()));
                    },
                    child: _buildServiceCard('Orthopedist ')),
              ],
            ),
            /*
            Orthopedist
             */
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String serviceName) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 89, 138, 128),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromARGB(255, 89, 138, 128), width: 2),
      ),
      child: Center(
        child: Text(
          serviceName,
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
