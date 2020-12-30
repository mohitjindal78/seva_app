import 'package:flutter/material.dart';
import 'package:seva_app/utilities/dummy_satsangi.dart';
import 'package:seva_app/widgets/satsangi_card.dart';
import 'package:seva_app/models/satsangi.dart';
import 'package:seva_app/screens/new_payment.dart';

class SansthaScreen extends StatefulWidget {
  @override
  _SansthaScreenState createState() => _SansthaScreenState();
}

class _SansthaScreenState extends State<SansthaScreen> with RestorationMixin {
  final RestorableBool isSelectedSatsangi = RestorableBool(false);
  final RestorableBool isSelectedSevadar = RestorableBool(false);
  final RestorableBool isSelectedAdhyaksh = RestorableBool(false);
  final RestorableBool isSelectedAdmin = RestorableBool(false);

  @override
  String get restorationId => 'filter_chip_demo';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(isSelectedSatsangi, 'selected_satsangi');
    registerForRestoration(isSelectedSevadar, 'selected_sevadar');
    registerForRestoration(isSelectedAdhyaksh, 'selected_adhyaksh');
    registerForRestoration(isSelectedAdmin, 'selected_admin');
  }

  final List<Satsangi> _activeSatsangi = DUMMY_SATSANGI;

  void _addNewSatsangi(BuildContext ctx, List<Satsangi> currentSatsangi) {
    Navigator.pushNamed(context, NewPayment.id);
  }

  @override
  Widget build(BuildContext context) {
    final chips = [
      FilterChip(
        label: Text('Satsangi'),
        selected: isSelectedSatsangi.value,
        onSelected: (value) {
          setState(() {
            isSelectedSatsangi.value = !isSelectedSatsangi.value;
          });
        },
      ),
      FilterChip(
        label: Text('Sevadar'),
        selected: isSelectedSevadar.value,
        onSelected: (value) {
          setState(() {
            isSelectedSevadar.value = !isSelectedSevadar.value;
          });
        },
      ),
      FilterChip(
        label: Text('Adhyaksh'),
        selected: isSelectedAdhyaksh.value,
        onSelected: (value) {
          setState(() {
            isSelectedAdhyaksh.value = !isSelectedAdhyaksh.value;
          });
        },
      ),
      FilterChip(
        label: Text('Admin'),
        selected: isSelectedAdmin.value,
        onSelected: (value) {
          setState(() {
            isSelectedAdmin.value = !isSelectedAdmin.value;
          });
        },
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "name or phone number or city",
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Wrap(
            children: [
              for (final chip in chips)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: chip,
                )
            ],
          ),
          SingleChildScrollView(
            child: Container(
              height: 490,
              child: SatsangiCard(
                activeSatsangi: _activeSatsangi,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          return _addNewSatsangi(context, _activeSatsangi);
        },
      ),
    );
  }
}
