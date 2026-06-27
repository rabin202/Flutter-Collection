import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/pages/single_note.dart';
import 'package:notes_app/utils/notes_list.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/providers/note_provider.dart';

import '../models/note.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();





}

class _SearchPage extends State<SearchPage> {

  final searchQueryController = TextEditingController();

  @override
  void dispose() {
    searchQueryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Note>? notes;
    bool isSearch = Provider.of<NoteProvider>(context).isSearching;
    if(isSearch)
      {
        notes = Provider.of<NoteProvider>(context).filteredNotes;
      }
    final borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color:Theme.of(context).colorScheme.secondary,
        )
    );
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadiusGeometry.circular(10)
              ),
              child: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
           centerTitle: true,
           title:  SizedBox(
             height: 40,
             child: TextField(
               showCursor: true,
               autofocus: true,
               cursorColor: Colors.white,
               controller: searchQueryController,
               style: TextStyle(
                 fontSize: 16,
                 color: Colors.white
               ),
               decoration: InputDecoration(
                 enabledBorder: borderStyle,
                 focusedBorder: borderStyle,
                 hintText: "Search by the keyword...",
                 hintStyle: TextStyle(
                   fontSize: 16,
                   color: Colors.white,
                 ),
                 prefixIcon: const Icon(Icons.search),

                 contentPadding: const EdgeInsets.symmetric(
                   vertical: 12,),
               ),
               onSubmitted: (value) {
                 context.read<NoteProvider>().searchNotes(value);
               },
             ),
           )
        ),
        body:(isSearch) ?
            (notes!.isEmpty) ?
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Text(
                  "No Notes Found!",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ) : Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return (constraints.maxWidth < 750) ?
                      ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: notes!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: Slidable(
                              key: Key(notes![index].title),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                extentRatio: 1,
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      Provider.of<NoteProvider>(context,listen: false).deleteNote(notes![index]);
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
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .secondary,
                                // color: Color.fromARGB(255,Random().nextInt(255),
                                //     Random().nextInt(255),
                                //     Random().nextInt(255)),
                                borderRadius: BorderRadiusGeometry.circular(10),

                              ),
                              child: NotesList(note: notes![index]),
                            ),
                          ),
                        ),
                        );
                      },
                    ) :
                    GridView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: notes!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: (constraints.maxWidth > 600)?(constraints.maxWidth > 790)?4:3 : 2.5),
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
                                key: Key(notes![index].title),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  extentRatio: 1,
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        Provider.of<NoteProvider>(context,listen: false).deleteNote(notes![index]);
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
                                  child: NotesList(note:notes![index]),
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
        ) : null,
    );
  }
}
