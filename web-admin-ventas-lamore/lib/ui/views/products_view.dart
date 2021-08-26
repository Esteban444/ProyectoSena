import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/products_provider.dart';

import 'package:admin_dashboard/datatables/products_datasource.dart';

import 'package:admin_dashboard/ui/buttons/custom_icon_buttom.dart';
import 'package:admin_dashboard/ui/modals/product_modal.dart';

//import 'package:admin_dashboard/ui/labels/custom_labels.dart';


class ProductsView extends StatefulWidget {

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<ProductsProvider>(context, listen: false).getproducts();
  }


  @override
  Widget build(BuildContext context) {

    final productos = Provider.of<ProductsProvider>(context).products; // para pasar los productos a la tabla.

    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          //Text('Productos', style: CustomLabels.h1 ),

          //SizedBox( height: 10 ),

          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Cantidad')),
              DataColumn(label: Text('Precio')),
              DataColumn(label: Text('Acciones')),
            ],
            source: ProductsDataTableSource(productos, context),//instancioa de data sourse
            header: Text('Lista de productos disponibles.',maxLines: 2,),
            onRowsPerPageChanged: (value) {
               setState(() {
                 _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context, 
                    builder: (_) => ProductsModal()
                  );

                }, 
                text: 'Crear', 
                icon: Icons.add_outlined
              )
            ],
          )


        ],
      ),
    );
  }
}