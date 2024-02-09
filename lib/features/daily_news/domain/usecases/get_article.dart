import 'package:goto_app/core/resources/data_states.dart';
import 'package:goto_app/core/usecases/usecase.dart';
import 'package:goto_app/features/daily_news/domain/entities/articles.dart';
import 'package:goto_app/features/daily_news/domain/repository/article_repository.dart';

// usecase is where business logic gets executes
// it gets data from repository

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
