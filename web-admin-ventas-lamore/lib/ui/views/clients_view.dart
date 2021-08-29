import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/clientesProvider.dart';
import 'package:admin_dashboard/datatables/clients_datasource.dart';


class DashboardView extends StatefulWidget {

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
   
   int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<ClientsProvider>(context, listen: false).getproducts();
  }


  @override
  Widget build(BuildContext context) {

    final productos = Provider.of<ClientsProvider>(context).clientes; // para pasar los clientes a la tabla.

    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          //Text('Productos', style: CustomLabels.h1 ),

          //SizedBox( height: 10 ),

          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Documento')),
              DataColumn(label: Text('Nombres')),
              DataColumn(label: Text('Apellidos')),
              DataColumn(label: Text('Direccion')),
              DataColumn(label: Text('Telefono')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Acciones')),
            ],
            source: ClientsDataTableSource(productos, context),//instancioa de data sourse
            header: Text('Lista de clientes disponibles.',maxLines: 2,),
            onRowsPerPageChanged: (value) {
               setState(() {
                 _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              /*CustomIconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context, 
                    builder: (_) => ProductsModal()
                  );

                }, 
                text: 'Crear', 
                icon: Icons.add_outlined
              )*/
            ],
          )


        ],
      ),
    );
  }
}