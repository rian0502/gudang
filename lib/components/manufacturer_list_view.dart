import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/manufacturer.dart';


class ManufacturerListViewScreen extends StatefulWidget {
  final List<Data>? manufacture;
  const ManufacturerListViewScreen({Key? key, this.manufacture}) : super(key: key);

  @override
  State<ManufacturerListViewScreen> createState() => _ManufacturerListViewScreenState();
}

class _ManufacturerListViewScreenState extends State<ManufacturerListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.manufacture!.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
                title: Text(widget.manufacture![index].namaManufactur!),
                trailing: PopupMenuButton(
                  child: const Icon(Icons.question_mark_outlined),
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(value: 1,child: Text('Edit'),),
                    const PopupMenuItem(value: 2,child: Text('View'),),
                  ],
                  onSelected: (value){
                    if(value == 1){
                      context.push('/editManufacturer', extra: widget.manufacture![index]);
                    }else{
                      print(widget.manufacture![index].namaManufactur);
                    }
                  },
                )
            )
        );
      },
    );
  }
}
