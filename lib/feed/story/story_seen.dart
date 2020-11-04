import 'package:flutter/foundation.dart';
import 'package:wook_application/feed/story/stories.dart';
import 'package:wook_application/util/dummy_data.dart';

class StorySeen extends ChangeNotifier {


  Map<StoryStatus, List<Story>> _storiesPartitionMap = {
    StoryStatus.SEEN: [],
    StoryStatus.NOT_SEEN: Data.dummyDataStories
  };

  Map<Story, int> _storyViewsCountMap = Map.fromIterable(Data.dummyDataStories,
      key: (story) => story, value: (story) => 0);

  ///update
  void seeTheStory(Story story) {
    if (!_storiesPartitionMap[StoryStatus.SEEN].contains(story)) {
      _storiesPartitionMap[StoryStatus.SEEN].add(story);
      _storiesPartitionMap[StoryStatus.NOT_SEEN].remove(story);
    }
    notifyListeners();
  }

  void incrementViewCount(String storyTag) {
    Story key = _populateStoryByTag(storyTag);
    storyViewsCountMap[key]++;
  }

  void seeTheStoryByTag(String storyTag) {
    Story key = _populateStoryByTag(storyTag);
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

  Map<StoryStatus, List<Story>> get storiesPartitionMap =>
      _storiesPartitionMap;

  set storiesPartitionMap(Map<StoryStatus, List<Story>> value) {
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

///can be replaced by bool for better performance
enum StoryStatus { SEEN, NOT_SEEN }
