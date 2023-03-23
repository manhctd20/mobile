import 'package:btgk/modal/items.dart';
import 'package:btgk/widget/card_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _MyAppState();
}

class _MyAppState extends State<Homepage> {
  final List<DataItems> items = [];

  //Thêm một công việc mới
  void _handleAddTask(String name, DateTime deadline) {
    final newItem = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  //Xoa mot cong viec
  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((items) => items.id == id);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ToDoList',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
                height: 160,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 35, 139, 73),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: Text(
                      "User",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
              leading: const Icon(
                FontAwesomeIcons.house,
                size: 36,
                color: Color.fromARGB(255, 63, 60, 33),
              ),
              title: const Text(
                "Home",
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetail()));
              },
              leading: const Icon(
                FontAwesomeIcons.solidHeart,
                size: 36,
                color: Color.fromARGB(255, 63, 60, 33),
              ),
              title: const Text(
                "Favorite",
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => CreateTask()));
              },
              leading: const Icon(
                FontAwesomeIcons.pen,
                size: 36,
                color: Color.fromARGB(255, 63, 60, 33),
              ),
              title: const Text(
                "Create task",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const ListTile(
              leading: Icon(
                FontAwesomeIcons.gear,
                size: 36,
                color: Color.fromARGB(255, 63, 60, 33),
              ),
              title: Text(
                "Setting",
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: items
              .map((item) => CardBody(
                    index: items.indexOf(item),
                    item: item,
                    handleDelete: _handleDeleteTask,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.grey[400],
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                String newtask = '';
                DateTime deadline = DateTime.now();
                return AlertDialog(
                  title: Text('Thêm mới 1 công việc'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        TextField(
                          autofocus: true,
                          decoration: const InputDecoration(
                              // Hiển thị hộp nhập liệu
                              labelText: 'Tên công việc'),
                          keyboardType: TextInputType.text,
                          onChanged: (value) =>
                              newtask = value, // Lấy giá trị nhập vào
                        ),
                        const SizedBox(height: 16),
                        const Text('Deadline'),
                        const SizedBox(height: 8),
                        // Hiển thị hộp chọn ngày
                        ElevatedButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: deadline,
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2101));
                            if (picked != null && picked != deadline)
                              setState(() => {deadline = picked});
                          },
                          child: Text(
                            deadline.toString().substring(0), // Hiển thị ngày
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('ADD'),
                      onPressed: () {
                        _handleAddTask(newtask, deadline);
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              }
              // builder: (BuildContext content) {
              //   return ModalBotton(addTask: _handleAddTask);
              // },
              );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
