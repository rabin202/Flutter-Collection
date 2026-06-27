import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/note_provider.dart';


class EditPage extends StatefulWidget {
  final Note? currentNote;
  const EditPage({super.key,this.currentNote});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  Note? newNote;
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.currentNote != null) {
      _titleController.text = widget.currentNote!.title;
      _descriptionController.text = widget.currentNote!.description;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<NoteProvider>(context).getNotes();
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
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AlertDialog(
                        icon: Icon(Icons.info_outline),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        content: Text('Are you sure you want to discard your changes ?',
                          style:Theme.of(context).textTheme.bodySmall ,textAlign: TextAlign.center,),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop(context,);

                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red,
                                ),
                                child: const Text('Discard'),

                              ),
                              TextButton(
                                onPressed: () {
                                    if(_titleController.text.isNotEmpty)
                                    {
                                      newNote = Note(
                                        title: _titleController.text,
                                        description: (_descriptionController.text.isNotEmpty)?_descriptionController.text:
                                        " "
                                      );
                                      if(widget.currentNote !=null)
                                        {
                                          int  addPlace = notes.indexOf(widget.currentNote!);

                                          if (addPlace != -1) {
                                            Provider.of<NoteProvider>(context,listen: false).editNote(newNote!, addPlace);

                                          }
                                        }
                                      else
                                        {
                                          Provider.of<NoteProvider>(context,listen: false).addNote( newNote!);

                                        }
                                    }
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();

                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.green,
                                ),
                                child: const Text('Keep'),
                              ),
                            ],
                          ),

                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AlertDialog(
                    icon: Icon(Icons.info_outline),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    content: Text('Save Changes ?',
                    style:Theme.of(context).textTheme.bodySmall ,textAlign: TextAlign.center,),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                            ),
                            child: const Text('Cancel'),

                          ),
                          TextButton(

                            onPressed: () {
                                if (_titleController.text.isNotEmpty) {
                                  newNote = Note(
                                      title: _titleController.text,
                                      description: (_descriptionController.text
                                          .isNotEmpty) ? _descriptionController
                                          .text :
                                      " "
                                  );
                                  if (widget.currentNote != null) {
                                    int addPlace = notes.indexOf(
                                        widget.currentNote!);

                                    if (addPlace != -1) {
                                      Provider.of<NoteProvider>(context,listen: false).editNote( newNote!,addPlace);

                                    }
                                  }
                                  else {
                                      Provider.of<NoteProvider>(context,listen: false).addNote( newNote!);
                                  }
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                }
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green,

                            ),
                            child: const Text('Save'),
                          ),
                        ],
                      ),

                    ],
                  ),
                );
              },
            );
          },
            icon: Icon(Icons.save),
            style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                )
            ),),
          SizedBox(width: 30,)
          
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                showCursor: true,
                autofocus: true,
                maxLines: null,
                cursorColor: Colors.white,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                  hintText: 'Title',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  enabledBorder: InputBorder.none,
                  )
                  ),
              SizedBox(height: 20.0),
              TextFormField(
                maxLines: null,
                controller: _descriptionController,
                style: Theme.of(context).textTheme.bodySmall,
                showCursor: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: ('Type something...'),
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  enabledBorder: InputBorder.none,

                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
