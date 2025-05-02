import 'package:admin_dashboard/components/side_menu.dart';
import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/controllers/menu_app_controller.dart';
import 'package:admin_dashboard/models/recent_file.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/screens/dashboard/component/chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'component/header.dart';
import 'component/my_fiels.dart';
import 'component/recent_files.dart';
import 'component/storage_details.dart';
import 'component/storage_info_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyFiels(),
                        SizedBox(height: defaultPadding),
                        RecentFiles(),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if(Responsive.isMobile(context))
                          StorageDetails(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                  if(!Responsive.isMobile(context))
                  Expanded(flex: 2, child: StorageDetails()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
