class HistoryList {
  final List<HistoryDetails> historyList;

  HistoryList({required this.historyList});

  // String toJson() => json.encode({
  //     'historyList': historyList.map((x) => x).toList(),
  //   });

  // HistoryList copyWith({List<HistoryDetails>? historyList}) {
  //   return HistoryList(
  //     historyList: historyList ?? this.historyList,
  //   );
  // }
}

class HistoryDetails {}
