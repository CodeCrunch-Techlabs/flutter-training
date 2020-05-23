import 'package:travel_demo/models/activity.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/bg11.jpg',
    name: 'Jaydip patel',
    type: 'Signtseeing tour',
    startTimes: ['9:00 am', '11:00am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/bg12.jpg',
    name: 'Walking tour',
    type: 'Signtseeing tour',
    startTimes: ['11:00 am', '1:00pm'],
    rating: 4,
    price: 230,
  ),
  Activity(
    imageUrl: 'assets/images/bg13.jpg',
    name: 'Tracking tour',
    type: 'Signtseeing tour',
    startTimes: ['4:00 pm', '6:00pm'],
    rating: 5,
    price: 300,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/bg15.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'visit venice for amazing and unforgottable advanture',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/bg16.jpg',
    city: 'Mumbai',
    country: 'India',
    description: 'visit Mumbai for amazing and unforgottable advanture',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/bg17.jpg',
    city: 'Ahmedabad',
    country: 'India',
    description: 'visit Ahmedabad for amazing and unforgottable advanture',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/bg18.jpg',
    city: 'Surat',
    country: 'India',
    description: 'visit Surat for amazing and unforgottable advanture',
    activities: activities,
  ),
];
