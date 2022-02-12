import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactUs extends StatefulWidget {
  MainContactUs createState() => MainContactUs();

}
class MainContactUs extends State<ContactUs> {
  final controllerTo = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(



        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.white,
        // HEADER
        appBar: AppBar(
          bottomOpacity: 0,
          elevation: 0.0,
          shadowColor: Colors.white,
          toolbarHeight: 60,
          automaticallyImplyLeading: true ,
          iconTheme: const IconThemeData(
            color: Color(0xFFFE6F4B), //change your color here
          ),
          centerTitle: false,
          title: Text('Contact Us' , style: TextStyle(fontFamily: 'BankGM' , fontSize: 22, color: Colors.blueGrey),),


          backgroundColor: Colors.white,
        ),

        //////////////////////////////////////////////////////////////////////////////////////// Buttom Bar





        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 30,right: 30,bottom: 50,top: 5),
            child: Column(
              children: [
                buildTextField(title : 'To' , controller: controllerTo ,labelText: 'Email'),
                const SizedBox(height: 16,),
                buildTextField(title : 'Subject' , controller: controllerSubject , labelText: 'Sub'),
                const SizedBox(height: 16,),
                buildTextField(title : 'Message' , controller: controllerMessage,maxLines:8, labelText: 'Message'),
                const SizedBox(height: 32,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                    onPressed: ()=>
                    launchEmail(
                      toEmail: controllerTo.text,
                      subject: controllerSubject.text,
                      message: controllerMessage.text,
                    ),

                    child: const Text("SEND")

                ),

              ],
            ),







        ));


  }

  Future launchEmail({
    required String toEmail,
    required String subject,
    required String message,
}) async {
    final url ='mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
  if(await canLaunch(url)){
    await launch(url);
  }

  }
  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
    String labelText = "",

  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      const SizedBox(height: 8,),
      TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
            labelText: labelText,

            labelStyle: TextStyle(color: Colors.grey , fontSize: 18),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black54),
              borderRadius: BorderRadius.circular(15),
            )),
      )
    ],
  );
}


