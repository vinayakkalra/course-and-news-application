import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SupportScreen();
  }
}

// Widget _buildDivider(){
//   return Container(
//     width: double.infinity,
//     height: 1.0,
//     color: Colors.grey.shade300,
//   );
// }
class _SupportScreen extends State {
  List<String> _supportList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: FloatingActionButton(
          elevation: 5.0,
          onPressed: () {
            _showAddSupportTicket(context);
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            size: 32,
            color: Colors.indigoAccent,
          ),
        ),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: _supportList.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final ticketDescription = _supportList[index];
          return Card(
            color: Colors.orangeAccent,
            elevation: 8.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
            margin: EdgeInsets.all(10.0),
            child: ListTile(
                title: Text(ticketDescription),
                trailing: Icon(Icons.menu),
                onTap: (){
                  SnackBar snackBar = SnackBar(content: Text("$ticketDescription"));
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                ),
          );
        },
      ),
    );
  }

  void _showAddSupportTicket(BuildContext context) {
    final _todoDescriptionFormController = TextEditingController();
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: new Container(
              color: Colors.transparent,
              child: new Container(
                height: 230,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15, top: 25.0, right: 15, bottom: 30),
                  child: ListView(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              controller: _todoDescriptionFormController,
                              textInputAction: TextInputAction.newline,
                              maxLines: 4,
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w400),
                              autofocus: true,
                              decoration: const InputDecoration(
                                  hintText: 'I need help...',
                                  labelText: 'New Support Ticket',
                                  labelStyle: TextStyle(
                                      color: Colors.indigoAccent,
                                      fontWeight: FontWeight.w500)),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Empty description!';
                                }
                                return value.contains('')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, top: 15),
                            child: CircleAvatar(
                              backgroundColor: Colors.indigoAccent,
                              radius: 18,
                              child: IconButton(
                                icon: Icon(
                                  Icons.save,
                                  size: 22,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  if (_todoDescriptionFormController
                                      .value.text.isNotEmpty) {
                                    setState(() {
                                      _supportList.add(
                                          _todoDescriptionFormController
                                              .value.text);
                                    });

                                    //dismisses the bottomsheet
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      );
  }
}
