
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/product.dart';
import 'package:admin_dashboard/ui/modals/product_modal.dart';


class ProductsDataTableSource extends DataTableSource {

  final List<Product> products;
  final BuildContext context;

  ProductsDataTableSource(this.products, this.context);


  @override
  DataRow getRow(int index) {
    
    final producto = this.products[index];

    return DataRow.byIndex(
      index:  index,
      cells: [
        DataCell(Text('Cel id')),
        DataCell(Text(producto.nombreProducto)),
        DataCell(Text('cel cantidad')),
        DataCell(Text('cel precio')),
        DataCell(

          Row(
             children: [
               IconButton(
                 icon: Icon(Icons.edit_outlined),
                 onPressed: () { 
                   showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context, 
                    builder: (_) => ProductsModal(producto: producto,)
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
                            /*await Provider.of<CategoriesProvider>(context, listen: false)
                             .deleteCategory(categoria.id);
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
  
  int get rowCount => products.length;

  @override

  int get selectedRowCount => 0;

}