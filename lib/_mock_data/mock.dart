import 'package:tiktok_clone/Models/user.dart';
import 'package:tiktok_clone/Models/video.dart';

User currentUser = User('stackedList', "https://picsum.photos/id/1062/400/400");

User demoUser1 = User('user_1',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80');

User demoUser2 = User('user_2',
    'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');

User demoUser3 = User('user_3',
    'https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80');

User demoUser4 = User('user_4',
    'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');

final List<Video> Videos = [
  Video('v1.mp4', demoUser1, 'caption', "audioName", '12.5k', '123'),
  Video('v2.mp4', demoUser2, 'caption', "audioName", '14k', '45'),
  Video('v3.mp4', demoUser3, 'caption', "audioName", '1k', '126'),
  Video('v4.mp4', demoUser4, 'caption', "audioName", '125', '35'),
];
