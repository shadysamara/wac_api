import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wac_coaching/auth/api.dart';
import 'package:wac_coaching/auth/models/register_request.dart';
import 'package:wac_coaching/auth/models/register_response.dart';
import 'package:wac_coaching/shared_prefrences_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrencesHelper.sharedPrefrencesHelper.initSharedPrefrences();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Coaching'),
        ),
        body: Center(
          child: RaisedButton(onPressed: () {
            showSlidingBottomSheet(context, builder: (context) {
              return SlidingSheetDialog(
                elevation: 8,
                cornerRadius: 16,
                snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [0.4, 0.7, 1.0],
                  positioning: SnapPositioning.relativeToAvailableSpace,
                ),
                builder: (context, state) {
                  return Container(
                      height: 700,
                      child: Material(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                child: Column(
                                  children: [
                                    FlutterLogo(
                                      size: 70,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text('name'), Text('value')],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text('name'), Text('value')],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text('name'), Text('value')],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ));
                },
              );
            });
          }),
        ));
  }
}
