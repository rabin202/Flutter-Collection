import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/pages/search_page.dart';
import 'package:notes_app/pages/single_note.dart';
import 'package:notes_app/utils/notes_list.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'dart:math';

import 'edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NoteProvider>(context).getNotes();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Notes",
        style: Theme.of(context).textTheme.titleLarge,),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>SearchPage()));
          },
          icon: Icon(Icons.search),
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            )
          ),),
          SizedBox(width: 20,),
          IconButton(onPressed: (){
            showDialog(context: context,
                builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: SimpleDialog(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        children: [
                          SizedBox(height: 70,),
                          Text('Notes App',
                          style:Theme.of(context).textTheme.bodySmall ,textAlign: TextAlign.center,),
                          SizedBox(height: 70,),
                        ]
                      ),
                    );
                }
            );
          }, icon: Icon(Icons.info_outline),
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                )
            ),),
          SizedBox(width: 10,),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditPage())).then((value) {
            setState(() {});
          });
      },
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        focusElevation: 0,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: .5,
                blurRadius: 1,
              ),
            ],
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      body:(notes.isEmpty)
          ? LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Spacer(),

              Row(
                children: [
                  const Spacer(),

                  Expanded(
                    child: SvgPicture.asset(
                      "assets/images/Notebooksvg.svg",
                    ),
                  ),

                  const Spacer(),
                ],
              ),

              FittedBox(
                child: Text(
                  "Create your first note!",
                  style: TextStyle(
                    fontSize: constraints.maxWidth < 600
                        ? 18
                        : 22,
                  ),
                ),
              ),

              const Spacer(flex: 2),
            ],
          );
        },
      )
      : Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return (constraints.maxWidth < 520) ?
                  ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: notes.length,
                  itemBuilder: (context,index){
                    return  GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SingleNote(
                              noteId:index
                          )),);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          child: Slidable(
                            key: Key(notes[index].title),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              extentRatio: 1,
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    Provider.of<NoteProvider>(context,listen: false).deleteNote(notes[index]);
                                  },
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),

                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                // color: Color.fromARGB(255,Random().nextInt(255),
                                //     Random().nextInt(255),
                                //     Random().nextInt(255)),
                                borderRadius: BorderRadiusGeometry.circular(10),

                              ),
                              child: NotesList(note:notes[index]),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ) :
                      GridView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: notes.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 5.0,childAspectRatio: (constraints.maxWidth > 600)?(constraints.maxWidth > 790)?4:3 : 2.5),
                        itemBuilder:  (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SingleNote(
                                    noteId:index
                                )),);
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(10),
                                child: Slidable(
                                  key: Key(notes[index].title),
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    extentRatio: 1,
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          Provider.of<NoteProvider>(context,listen: false).deleteNote(notes[index]);
                                        },
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ],
                                  ),

                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondary,
                                      // color: Color.fromARGB(255,Random().nextInt(255),
                                      //     Random().nextInt(255),
                                      //     Random().nextInt(255)),
                                      borderRadius: BorderRadiusGeometry.circular(10),

                                    ),
                                    child: NotesList(note:notes[index]),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                },
              ),
            ),
          )
        ],
      )
    );
  }
}
