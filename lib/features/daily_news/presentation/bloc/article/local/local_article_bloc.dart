import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news/features/daily_news/domain/usecases/save_article.dart';

import '../../../../domain/entities/article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  FutureOr<void> onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticlesState> emit) {}

  FutureOr<void> onRemoveArticle(
      RemoveArticle event, Emitter<LocalArticlesState> emit) {}

  FutureOr<void> onSaveArticle(
      SaveArticle event, Emitter<LocalArticlesState> emit) {}
}
