class InboxModel {
  int idInbox;
  int persona1;
  int persona2;

  InboxModel({this.idInbox, this.persona1, this.persona2});

  static InboxModel fromJson(Map<String, dynamic> json) {
    return InboxModel(
      idInbox: json['idInbox'],
      persona1: json['persona1'],
      persona2: json['persona2'],
    );
  }

  Map<String, dynamic> toJson() => {
        "idInbox": idInbox,
        "persona1": persona1,
        "persona2": persona2,
      };
}
