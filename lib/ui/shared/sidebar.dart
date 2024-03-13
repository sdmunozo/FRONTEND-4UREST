import 'package:dasha/ui/buttons/custom_outlined_button.dart';
import 'package:dasha/ui/shared/widgets/custom_title_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dasha/providers/auth_provider.dart';
import 'package:dasha/providers/sidemenu_provider.dart';
import 'package:dasha/router/router.dart';
import 'package:dasha/services/navigation_service.dart';
import 'package:dasha/ui/shared/widgets/logo.dart';
import 'package:dasha/ui/shared/widgets/menu_item.dart';
import 'package:dasha/ui/shared/widgets/text_separator.dart';

class Sidebar extends StatefulWidget {
  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);

    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    final authProvider = Provider.of<AuthProvider>(context);

    final brandName = authProvider.selectedBrand?.name ?? 'Nombre de Empresa';
    final brandId = authProvider.selectedBrand?.id ?? 'ID de Empresa';
    final branchName =
        authProvider.selectedBranch?.name ?? 'Nombre de Sucursal';
    final branchId = authProvider.selectedBranch?.id ?? 'ID de Sucursal';

    return Container(
      width: 256,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: Expanded(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Logo(),
            SizedBox(height: 25),
            CustomTitleRow(
              title: 'EMPRESA',
              text: brandName,
              icon: Icons.store,
              id: brandId,
            ),
            CustomTitleRow(
              title: 'SUCURSAL',
              text: branchName,
              icon: Icons.location_on,
              id: branchId,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                CustomOutlinedButton(
                  onPressed: () => {},
                  text: 'Cambiar Sucursal',
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
            TextSeparator(text: 'ADMIN DASHBOARD'),
            MenuItem(
              text: 'Inicio',
              icon: Icons.dashboard_outlined,
              onPressed: () => navigateTo(Flurorouter.dashboardRoute),
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            ),
            MenuItem(
              text: 'Cartas/Menús',
              icon: Icons.layers_outlined,
              onPressed: () => navigateTo(Flurorouter.catalogsRoute),
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.catalogsRoute,
            ),
            MenuItem(
                text: 'Configuración',
                icon: Icons.settings_outlined,
                onPressed: () {}),
            MenuItem(
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              onPressed: () => navigateTo(Flurorouter.iconsRoute),
              isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
            ),
            SizedBox(
              height: 50,
            ),
            TextSeparator(text: 'Salir'),
            MenuItem(
                text: 'Cerrar sesión',
                icon: Icons.exit_to_app_outlined,
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false).logout();
                }),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xff092044),
          Color(0xff092042),
        ]),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10),
        ],
      );
}
