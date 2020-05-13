import 'package:flutter/material.dart';

class EditData extends StatefulWidget {

  final String FirstNameFromViewData;
  final String LastNameFromViewData;

  const EditData({
    Key key,
    this.FirstNameFromViewData,
    this.LastNameFromViewData
  }) : super(key: key);


  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();

  String ValidationMessage = "";
  bool ValidationVisiable = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      FirstName.text = widget.FirstNameFromViewData;
      LastName.text = widget.LastNameFromViewData;
    });
  }

  void validation(){

    if(FirstName.text == widget.FirstNameFromViewData && LastName.text == widget.LastNameFromViewData){
      setState(() {
        ValidationMessage = "You did not change any value, change any value to save";
        ValidationVisiable = true;
      });
    }
    else{
      setState(() {
        ValidationVisiable = false;
      });

      print(FirstName.text+" "+LastName.text);

      print("هنا يتم ارسال المعلومات من خلال api الخاص بالتعديل من نوع put ،\n واذا تم حفظ البيانات الجديده للمستخدم بنجاح يتم الانتقال من خلال pushReplacement \n وليس الرجوع للخلف الى صفحة عرض البيانات \n\n");
      print("وعند فتح صفحة عرض البيانات يتم استدعاء بيانات المستخدم لاظهارها وسيتم اظهار البيانات الجديده");
      print("ولكن عند الرجوع للصفحه الخلفيه لن يتم استدعاء المعلومات الجديده وسيتم اظهار المعلومات القديمه");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Useer Data"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Visibility(
              visible: ValidationVisiable,
              child: Column(
                children: <Widget>[

                  Text(
                    ValidationMessage,
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  )

                ],
              ),
            ),

            Text(
                "First Name : "
            ),

            TextField(
              controller: FirstName,
            ),

            SizedBox(height: 10,),

            Text(
                "Last Name : "
            ),

            TextField(
              controller: LastName,

            ),

            SizedBox(height: 40,),

            Container(
              color: Colors.blue,
              child: RawMaterialButton(
                child: Text(
                  "  Save User Data  ",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                onPressed: (){
                  validation();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
