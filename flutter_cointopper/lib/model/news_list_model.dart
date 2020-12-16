import 'package:flutter_cointopper/entity/news_list_entity.dart';
import 'package:meta/meta.dart';

@immutable
class NewsListModel {
  final int id;
  final String titleEn;
  final String date;
  final String postLink;
  final String photoFile;
  final int visits;
  final String seoDescriptionEn;
  final String createdAt;

  NewsListModel(this.id, this.titleEn, this.date, this.postLink, this.photoFile,
      this.visits, this.seoDescriptionEn, this.createdAt);

  NewsListEntity toEntity() {
    return NewsListEntity(id, titleEn, date, postLink, photoFile, visits,
        seoDescriptionEn, createdAt);
  }

  static NewsListModel fromEntity(NewsListEntity entity) {
    return NewsListModel(
        entity.id,
        entity.titleEn,
        entity.date,
        entity.postLink,
        entity.photoFile,
        entity.visits,
        entity.seoDescriptionEn,
        entity.createdAt);
  }
}
