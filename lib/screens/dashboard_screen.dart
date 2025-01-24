import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_admin_en/models/dashBoardBtn_model.dart';
import 'package:shopsmart_admin_en/widgets/dashboard_card.dart';

import '../providers/theme_provider.dart';
import '../widgets/title_text.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/DashboardScreen';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
        title: const TitlesTextWidget(label: "Admin Panel"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.setDarkTheme(themeValue: !themeProvider.getIsDarkTheme);
            },
            icon: Icon(
              themeProvider.getIsDarkTheme ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          DashboardButtonModel.dashboardButtonList(context).length,
          (index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: DashBoardCard(
                imagePath:
                    DashboardButtonModel.dashboardButtonList(context)[index]
                        .imagePath,
                text:
                    DashboardButtonModel.dashboardButtonList(context)[index].text,
                onTap: DashboardButtonModel.dashboardButtonList(context)[index].onTap,
            ),
          ),
        ),
      ),
    );
  }
}
