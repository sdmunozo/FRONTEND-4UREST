import 'package:dasha/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:dasha/api/api_4uRest.dart';
import 'package:dasha/models/http/catalogs_response.dart';


class CatalogsProvider extends ChangeNotifier {

  List<Catalog> catalogs = [];
  final String branchId = "a877e751-537d-4fc3-8ea6-3ae54446b6af";


  getCatalogs() async {
    final resp = await Api4uRest.httpGet('/catalogs/catalogs/$branchId');
    final catalogsResp = CatalogsResponse.fromJson(resp);

    this.catalogs = [...catalogsResp.catalogs];

    //print( this.catalogs );

    notifyListeners();
  }
}

