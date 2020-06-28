class ShoutOut{
  final String name;
  final String comment;

  ShoutOut({this.name, this.comment});

  factory ShoutOut.fromMap(Map<String, dynamic> map) {
    return ShoutOut(name: 'Bert B', comment: 'Good Job! Keep on Keeping on!',);
  }

  static List<ShoutOut> dummy(){
    return [
      ShoutOut(name: 'Bert B', comment: 'Good Job! Keep on Keeping on!',),
      ShoutOut(name: 'Bert B', comment: 'Good Job! Keep on Keeping on!',),
      ShoutOut(name: 'Bert B', comment: 'Good Job! Keep on Keeping on!',),
      ShoutOut(name: 'Bert B', comment: 'Good Job! Keep on Keeping on!',),
      ShoutOut(name: 'Bert B', comment: 'Good Job! Keep on Keeping on!',),
      ShoutOut(name: 'Bert B', comment: 'Good Job! Keep on Keeping on!',),
    ];
  }
}