
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/clients.dart';
import 'package:admin_dashboard/ui/modals/product_modal.dart';


class ClientsDataTableSource extends DataTableSource {

  final List<Clients> clients;
  final BuildContext context;

  ClientsDataTableSource(this.clients, this.context);


  @override
  DataRow getRow(int index) {
    
    dynamic cliente = this.clients[index];

    return DataRow.byIndex(
      index:  index,
      cells: [
        DataCell(Text(cliente.idClientes.toString())),
        DataCell(Text(cliente.documento.toString())),
        DataCell(Text(cliente.nombres)),
        DataCell(Text(cliente.apellidos)),
        DataCell(Text(cliente.direccion)),
        DataCell(Text(cliente.telefono)),
        DataCell(Text(cliente.email)),
        DataCell(

          Row(
             children: [
               IconButton(
                 icon: Icon(Icons.edit_outlined),
                 onPressed: () { 
                   showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context, 
                    builder: (_) => ProductsModal()
                  );
                 },
               ),

               IconButton(
                 icon: Icon(Icons.delete_outlined, color: Colors.red.withOpacity(0.8),),
                 onPressed: () { 
                   final dialog = AlertDialog(
                     title: Text('¿Esta seguro de borrarlo?'),
                     content: Text('Borrar'),
                     actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, 
                           child: Text('No')
                        ),
                        TextButton(
                          child: Text('Si, Borrar'),
                          onPressed: () async {
                            /*await Provider.of<ClientsProvider>(context, listen: false)
                             .deleteClient(cliente.id);
                            Navigator.of(context).pop();*/
                          }, 
                        ),
                     ]
                   );

                   showDialog(context: context, builder: (_) => dialog);
                  },
               )
             ],
          )
          
        ),
      ]
    );
  }

  @override

  bool get isRowCountApproximate => false;

  @override
  
  int get rowCount => clients.length;

  @override

  int get selectedRowCount => 0;

}