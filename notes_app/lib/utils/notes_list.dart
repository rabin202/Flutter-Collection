import 'package:flutter/material.dart';
import 'package:notes_app/pages/single_note.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../providers/note_provider.dart';



class NotesList extends StatefulWidget {
  final Note note;
  const NotesList({super.key,required this.note});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    final noteId = (Provider.of<NoteProvider>(context).getNotes()).indexOf(widget.note);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.note.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 1.2,
                  ),),
          ),
        ],
      ),
    );
  }
}
