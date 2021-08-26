import 'package:admin_dashboard/models/product.dart';
import 'package:flutter/material.dart';


import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';



 class ProductsModal extends StatefulWidget {
   
   final Product? producto; // si viene nul crear un  nuevo producto

  const ProductsModal(
    {
      Key? key, 
     this.producto
    }
    ) : super(key: key
    ); 
 
  @override
  _ProductsModalState createState() => _ProductsModalState();
}

class _ProductsModalState extends State<ProductsModal> {

  String nombre = '';
  int? id;
  int? cantidad;
  int? precio;

  @override
  void initState() {
    super.initState();

    id     = widget.producto?.idProducto;
    nombre = widget.producto?.nombreProducto ?? '';
    cantidad = widget.producto?.cantidad;
    precio  = widget.producto?.precio;
  }

   @override
   Widget build(BuildContext context) {

     //final categoryProvider =  Provider.of<CategoriesProvider>(context, listen: false);

     return Container(
       padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
       height: 600,
       width: 300,
       decoration: buildBoxDecoration(),
       child:Column(
         children:[
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   widget.producto?.nombreProducto ?? 'Nueva Producto', style: CustomLabels.h1.copyWith(color: Colors.white),
                 ),
                 IconButton(
                   onPressed: () => Navigator.of(context).pop(), 
                   icon: Icon(Icons.close, color: Colors.white,)
                )
               ],
             ),

             Divider(color: Colors.white.withOpacity(0.3)),

             SizedBox(height: 10),

             TextFormField(
               initialValue: widget.producto?.nombreProducto ?? '',
               onChanged: (value) => nombre = value ,
               decoration: CustomInputs.loginInputDecoration(
                 hint: 'Nombre del producto', 
                 label: 'Nombre', 
                 icon: Icons.post_add_outlined
              ),
              style: TextStyle(color: Colors.white),
             ),

             SizedBox(height: 10),

             TextFormField(
               
               onChanged: (value) => nombre = value ,
               decoration: CustomInputs.loginInputDecoration(
                 hint: 'Cantidad de producto', 
                 label: 'Cantidad', 
                 icon: Icons.check_box_outlined
              ),
              style: TextStyle(color: Colors.white),
             ),

             SizedBox(height: 10),

             TextFormField(
               
               onChanged: (value) => nombre = value ,
               decoration: CustomInputs.loginInputDecoration(
                 hint: 'Precio de producto', 
                 label: 'Precio', 
                 icon: Icons.price_check_outlined
              ),
              style: TextStyle(color: Colors.white),
             ),

             Container(
               margin: EdgeInsets.only(top: 10),
               alignment: Alignment.center,
               child: CustomOutlinedButton(
                 onPressed: () async {

                   /*try{
                     if(id == null){
                      //crear
                      await categoryProvider.newCategory(nombre);
                      NotificationsService.showSnackbar('$nombre creada.');
                    }else{
                      // actualizar
                      await categoryProvider.updateCategory(id!, nombre);
                      NotificationsService.showSnackbar('$nombre actualizada.');
                    }
                    Navigator.of(context).pop();

                   }catch(e){
                     Navigator.of(context).pop();
                     NotificationsService.showSnackbarError('No se pude guardar la categoría.');
                   }*/
                    
                 }, 
                 
                 text: 'Guardar',
                 color: Colors.white,
              ),
             )
         ],
       ),
     );
   }

   BoxDecoration buildBoxDecoration() => BoxDecoration(

     borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:  Radius.circular(20)),
     color:  Color(0xff0f2041),
     boxShadow:[
        BoxShadow(
          color: Colors.black12
       )
     ]
   );
}