import 'package:animatedmovies/movies/domain_layer/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({super.id, super.backDropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backDropPath:
            json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
        id: json['id'],
      );
}
