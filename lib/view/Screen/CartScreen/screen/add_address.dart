import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:e_commerce/view/Widgets/custom_button.dart';
import 'package:e_commerce/view/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddress extends StatelessWidget {
   AddAddress({super.key});
  TextEditingController fullNameController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController stateController=TextEditingController();
  TextEditingController countryController=TextEditingController();
  TextEditingController zipController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Adding Shipping Address"),
        leading: const CustomBackButton(),
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
     //   padding: EdgeInsets.symmetric(horizontal:16.w,),
        child: Column(
          children: [
            SizedBox(height: 25.h,),
            CustomTextInputField(controller:addressController,
                hint:"Full name"),
            SizedBox(height: 20.h,),

            CustomTextInputField(controller:cityController,
                hint:"Address"),
            SizedBox(height: 20.h,),

            CustomTextInputField(controller:stateController,
                hint:"City"),
            SizedBox(height: 20.h,),

            CustomTextInputField(controller:zipController,
                hint:"State/Province/Region"),
            SizedBox(height: 20.h,),

            CustomTextInputField(controller:countryController,
                hint:"Zip Code(Postal Code)"),
            SizedBox(height: 20.h,),

            CustomButton(
                title:"SAVE ADDRESS",
                onPressed:(){

            })





          ],
        ),
      ),

    );
  }
}
