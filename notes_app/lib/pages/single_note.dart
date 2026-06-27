import 'package:flutter/material.dart';
import 'package:notes_app/pages/edit_page.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';

class SingleNote extends StatefulWidget {
  final int noteId;
  const SingleNote({super.key,required this.noteId });

  @override
  State<SingleNote> createState() => _SingleNoteState();
}

class _SingleNoteState extends State<SingleNote> {
  @override
  Widget build(BuildContext context) {
    final currentNote = (Provider.of<NoteProvider>(context).getNotes())[widget.noteId];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
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
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditPage(currentNote: currentNote,)));
          },
            icon: Icon(Icons.edit),
            style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                )
            ),),
          SizedBox(width: 20,),
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(currentNote.title,
              style: Theme.of(context).textTheme.bodyMedium,),
              SizedBox(height: 10,),
              Text(currentNote.description,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,

                )),
            ],
          ),
        ),
    );
  }
}
