import 'package:flutter/material.dart';
import 'package:comment_api_call_get/model.dart';
import 'package:comment_api_call_get/apiServices.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<CommentModel> CM = [];
  bool isLoading = false;

  _getData(){
    isLoading = true;
    ApiServices().getData().then((x){
      setState(() {
        isLoading = false;
        CM = x!;
      });
    });
  }


  @override
  void initState() {
    _getData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Comment Api"
        ),
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator(),) :
      ListView.builder(itemCount: CM.length,
          itemBuilder: (context,i) => Card(
        child: Column(
          children: [
            CircleAvatar(
              child: Text(CM[i].id.toString(),style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                backgroundColor: Colors.pink,
              ),),
            ),
            Text(CM[i].name.toString(),style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),),
            Text(CM[i].email.toString(),style: TextStyle(
              fontSize: 14,
              color: Colors.red,
            ),),
            Text(CM[i].body.toString(),style: TextStyle(
              fontSize: 12,
            ),),
          ],
        ),
        color: Colors.black,
      )),
    );
  }
}
