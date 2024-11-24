List<BoardingModel> boarding =[
  BoardingModel(
    image: 'assets/images/one.jpg',
    title: 'The right medication',
    body:'Alwazifat Walawazifati Natural physical therapy for raw and raw deficiency including chronic pain. You also need physical therapy and your pain will help heal, regain function and functions',
  ),
  BoardingModel(
    image: 'assets/images/two.jpg',
    title: 'The right medication',
    body:'Alwazifat Walawazifati Natural physical therapy for raw and raw deficiency including chronic pain. You also need physical therapy and your pain will help heal, regain function and functions',
  ),
  BoardingModel(
    image: 'assets/images/three.jpg',
    title: 'The right medication',
    body:'Alwazifat Walawazifati Natural physical therapy for raw and raw deficiency including chronic pain. You also need physical therapy and your pain will help heal, regain function and functions',
  ),
];


class BoardingModel
{
  String image ;
  String  title;
  String body ;
  BoardingModel ({required this.image,required this.title,required this.body,});
}