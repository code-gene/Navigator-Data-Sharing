class Notes {

  List<Notes > _notes;
  String _title;
  bool _noteRead;

  Notes(this._title, this._noteRead);

  String get getTitle => _title;
  bool get getReadState => _noteRead;

  set setReadState(bool readState) {
    this._noteRead = readState;
  }

  Notes.initializeNotes () {

    _notes = List<Notes>();
    _notes.add(Notes('Wedding',false));
    _notes.add(Notes('Office',false));
    _notes.add(Notes('Birthday',false));
    _notes.add(Notes('Holiday',false));
  }

  List<Notes> get getNotes => _notes;
}