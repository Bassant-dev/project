import 'package:flutter/material.dart';

bool hide = true;
class steps extends StatelessWidget {
  const steps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(),
      body: Padding( padding: EdgeInsets.all(16.0),
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/img/qr.jpg',
              height: 150,
              width:150,
              //width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10,),

          Stepper(
            controlsBuilder: (BuildContext ctx, ControlsDetails dtl){
              return Container(

                height: 1.0,
                child: Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: dtl.onStepContinue,
                      child: Text(hide == true ? '' : 'NEXT'),
                    ),
                    TextButton(
                      onPressed: dtl.onStepCancel,
                      child: Text(hide == true ? '' :'CANCEL'),
                    ),
                  ],
                ),
              );
            },
            steps: [
              Step(
                title: const Text('download image '),
                content: Container( height: 35.0,
                  child : MaterialButton(
                      minWidth: 150.0,
                      height: 35,

                      color: Colors.white,
                      child: new Text('Download',
                          style: new TextStyle(fontSize: 16.0, color: Colors.black)),
                      onPressed: () {}

                  ),
                ),
              ),

              Step(
                title: const Text('Put the marker on the wrist'),
                content: Container(
                  height: 0.0,
                ),
              ),

              Step(
                title: const Text('click try on button'),
                content: Container(
                  height: 0.0,
                ),
              ),
              Step(
                title: const Text('Point the mobile camera at the marker to scan it '),
                content: Container(
                    height: 0.0
                ),
              ),
            ],
          ),
        ],),
      ),
    );
  }
}