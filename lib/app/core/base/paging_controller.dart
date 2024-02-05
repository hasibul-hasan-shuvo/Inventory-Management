import 'package:get/get.dart';

import '/app/core/values/app_values.dart';

class PagingController<T> {
  int pageNumber = AppValues.defaultPageNumber;
  bool isLoadingPage = false;

  final RxBool _nextPageLoaderController = RxBool(false);
  bool get isLoadingNextPage => _nextPageLoaderController.value;
  void loadNextPage() => _nextPageLoaderController(true);
  void nextPageLoadingCompleted() => _nextPageLoaderController(false);

  final RxBool _lastPageController = RxBool(true);
  bool get isLastPage => _lastPageController.value;
  set isLastPage(bool isLast) => _lastPageController(isLast);

  initRefresh() {
    pageNumber = AppValues.defaultPageNumber;
    isLoadingPage = false;
    nextPageLoadingCompleted();
  }

  bool canLoadNextPage() {
    return !isLoadingPage && !isLastPage;
  }

  nextPage() {
    pageNumber++;
  }

  previousPage() {
    pageNumber--;
  }
}
