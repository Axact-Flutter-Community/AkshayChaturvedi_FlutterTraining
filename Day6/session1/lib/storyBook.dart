import 'story.dart';

class StoryBook {
  List<Story> _storyList = [
    Story(
        "Chikoo is not feeling well and hasn't eaten anything from 2 days decide what you should do?",
        "Take her to vet",
        "Wait for few days and see if she gets better",
        "https://www.naturepl.com/cache/pcache2/01194978.jpg",
        1,
        2),
    Story(
        "Vet has been told about all the symptoms and now has to make a decision. What should he do",
        "Take Blood Sample",
        "Check  abdomin",
        "https://previews.123rf.com/images/bialasiewicz/bialasiewicz1403/bialasiewicz140300619/26694749-vet-during-giving-medicament-to-dog-vertical.jpg",
        3,
        4),
    Story(
        "Her condition went worse and she needs immediate help!",
        "Take her to vet",
        "",
        "https://www.naturepl.com/cache/pcache2/01194978.jpg",
        1,
        -1),
    Story(
        "Blood results are fine! Vet gave her pills and sent Chikoo back home.\nBut you notice her condition didn't got better",
        "Take back to vet",
        "",
        "https://previews.123rf.com/images/bialasiewicz/bialasiewicz1403/bialasiewicz140300619/26694749-vet-during-giving-medicament-to-dog-vertical.jpg",
        1,
        -1),
    Story(
        "Vet feels there is some tension in lower abdomen.\nWhat should the vet do",
        "Give pain killers",
        "Take X-Ray",
        "https://files.brief.vet/migration/gallery/30016/abdominal-radiographs_figure1-30016-gallery.png",
        5,
        6),
    Story(
        "She was given medicines but still remains dehydrated and malnourished what you should do",
        "Take her to vet",
        "Wait for few days and see if she gets better",
        "https://veterinaryspecialtycare.com/wp-content/uploads/food-and-golden.jpg",
        1,
        2),
    Story(
        "Vet saw a foreign object but is not sure what to do. Decision is upto you",
        "It looks absolutely normal",
        "Something isn't correct! An operation has to be done",
        "https://lh3.googleusercontent.com/proxy/YCrfpMy2KVYpcJNotiyUPkjPzXs-1ZDcDhM9l8YJ0KrznCp5c2zyDNykF4Kdb5ERuOT_HAyXF9V8EKAILUJqUdOxle3bv_AOYMGaJCLFj4v3Ra9Pwg",
        5,
        7),
    Story(
        "The object was a plastic cap.\nVet removed it by surgery.\nBravo you saved her",
        "Play Again ?",
        "",
        "https://thumbs.dreamstime.com/z/portrait-photo-cute-fluffy-golden-puppy-standing-next-to-sofa-vertical-photo-cute-fluffy-golden-puppy-standing-next-to-sofa-165714962.jpg",
        0,
        -1)
  ];
  int _index = 0;

  void setIndex(int i) {
    _index = i;
  }

  int getFirstIndex() {
    return _storyList[_index].optionOne;
  }

  int getSecondIndex() {
    return _storyList[_index].optionTwo;
  }

  bool isDone() {
    return _index >= _storyList.length - 1;
  }

  String getStory() {
    return _storyList[_index].story;
  }

  String getFirst() {
    return _storyList[_index].first;
  }

  String getSecond() {
    return _storyList[_index].second;
  }

  String getWallpaper() {
    return _storyList[_index].wallpaper;
  }

  bool isVisible() {
    if (getSecond().length > 1)
      return true;
    else
      return false;
  }
}
