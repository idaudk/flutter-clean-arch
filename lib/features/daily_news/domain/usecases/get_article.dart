import 'package:goto_app/core/resources/data_states.dart';
import 'package:goto_app/core/usecases/usecase.dart';
import 'package:goto_app/features/daily_news/domain/entities/articles.dart';
import 'package:goto_app/features/daily_news/domain/repository/article_repository.dart';

// usecase is where business logic gets executes
// it gets data from repository

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  // get data from the repo
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  // IN DART CALL CAN BE CALLED BY USING CLASS NAME OBJECT.CALL() AND ALSO BY OBJECT()
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
