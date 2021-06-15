import 'package:bgmi_tip_tricks/core/ViewModel/get_services_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    newgetServices();
  }

  newgetServices() async {
    var provider = Provider.of<ServicesViewModel>(context, listen: false);
    if (provider.services.isNotEmpty) {
      provider.services.clear();
    }
    await provider.getServices();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ServicesViewModel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          20.heightBox,
          provider.loadStatus == ServicesLoadStatus.searching
              ? Center(child: CircularProgressIndicator())
              : provider.loadStatus == ServicesLoadStatus.empty
                  ? Container(
                      child: 'this is empty'.text.makeCentered(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.services.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Image.network(
                              provider.services[index].photo.toString()),
                        );
                      },
                    )
        ],
      ),
    );
  }
}
