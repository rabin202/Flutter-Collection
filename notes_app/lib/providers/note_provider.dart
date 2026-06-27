import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note.dart';

class NoteProvider with ChangeNotifier{
  final Box<Note> notesBox = Hive.box<Note>('notes');
  List<Note> _filteredNotes = [];
  bool _isSearching = false;

  List<Note> get filteredNotes => _filteredNotes;
  bool get isSearching => _isSearching;
  set isSearching(bool value) => value;

  void searchNotes(String? query) {
    if (query!.trim().isEmpty) {
      _isSearching = false;
      notifyListeners();
      return;
    }

    _isSearching = true;
    _filteredNotes.clear();

    _filteredNotes = getNotes().where((note) {
      return note.title
          .toLowerCase()
          .contains(query.toLowerCase()) ||
          note.description
              .toLowerCase()
              .contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }


  void clearSearch() {
    _isSearching = false;
    _filteredNotes.clear();
    notifyListeners();
  }


  List<Note> getNotes()
  {
    return notesBox.values.toList();
  }

  void addNote(Note noteToBeAdded)
  {
    notesBox.add(Note(title: noteToBeAdded.title, description: noteToBeAdded.description));
    notifyListeners();
  }

  void deleteNote(Note noteToBeDeleted)
  {
    noteToBeDeleted.delete();
    if(_filteredNotes.contains(noteToBeDeleted))
      {
        _filteredNotes.remove(noteToBeDeleted);
      }
    notifyListeners();
  }

  void editNote(Note editedNote, int indexOfNote) {
    final note = notesBox.getAt(indexOfNote);
    if (note != null) {
      note.title = editedNote.title;
      note.description = editedNote.description;
      note.save();
    }
    notifyListeners();
  }
}