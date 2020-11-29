import 'package:flutter/foundation.dart';
import 'package:wook_application/feed/story/stories.dart';
import 'package:wook_application/util/dummy_data.dart';

class StorySeen extends ChangeNotifier {
  static List<Story> stories = List.from(Data.dummyDataStories);

  Map<bool, List<Story>> _storiesPartitionMap = {true: [], false: stories};

  Map<Story, int> _storyViewsCountMap =
      Map.fromIterable(stories, key: (story) => story, value: (story) => 0);

  ///update
  void seeTheStory(Story story) {
    if (!_storiesPartitionMap[true].contains(story)) {
      _storiesPartitionMap[true].add(story);
      _storiesPartitionMap[false].remove(story);
    } else {
      _storiesPartitionMap[false].add(story);
      _storiesPartitionMap[true].remove(story);
    }
    notifyListeners();
  }

  void incrementViewCount(String storyTag) {
    Story key = _populateStoryByTag(storyTag);
    if (storyViewsCountMap[key] == 0) {
      storyViewsCountMap[key]++;
    } else {
      _storiesPartitionMap.remove(key);
      decrementViewCount(storyTag);
    }
  }

  void decrementViewCount(String storyTag) {
    Story key = _populateStoryByTag(storyTag);
    storyViewsCountMap[key]--;
  }

  void seeTheStoryByTag(String storyTag) {
    Story key = _populateStoryByTag(storyTag);
    incrementViewCount(storyTag);
    seeTheStory(key);
  }

  ///fail safe
  int getViewsCountByStoryTag(String storyTag) {
    try {
      Story key = _populateStoryByTag(storyTag);
      return storyViewsCountMap[key];
    } catch (e) {
      return 0;
    }
  }

  ///get set
  Map<Story, int> get storyViewsCountMap => _storyViewsCountMap;

  set storyViewsCountMap(Map<Story, int> value) {
    _storyViewsCountMap = value;
    notifyListeners();
  }

  Map<bool, List<Story>> get storiesPartitionMap => _storiesPartitionMap;

  set storiesPartitionMap(Map<bool, List<Story>> value) {
    _storiesPartitionMap = value;
    notifyListeners();
  }

  ///helper
  Story _populateStoryByTag(String storyTag) {
    Story key =
        _storyViewsCountMap.keys.firstWhere((story) => story.id == storyTag);
    return key;
  }
}
