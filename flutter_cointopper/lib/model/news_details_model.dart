import 'package:flutter_cointopper/entity/news_details_entity.dart'; 
import 'package:meta/meta.dart';

@immutable
class NewsDetailsModel {
  final int id;
  final String titleEn;
  final String date;
  final String postLink;
  final String photoFile;
  final int visits;
  final String detailsEn;
  final String seoDescriptionEn;
  final String createdAt;

  NewsDetailsModel(
      this.id,
      this.titleEn,
      this.date,
      this.postLink,
      this.photoFile,
      this.visits,
      this.detailsEn,
      this.seoDescriptionEn,
      this.createdAt);

  NewsDetailsEntity toEntity() {
    return NewsDetailsEntity(id, titleEn, date, postLink, photoFile, visits,
        detailsEn, seoDescriptionEn, createdAt);
  }

  static NewsDetailsModel fromEntity(NewsDetailsEntity entity) {
    return NewsDetailsModel(
        entity.id,
        entity.titleEn,
        entity.date,
        entity.postLink,
        entity.photoFile,
        entity.visits,
        entity.detailsEn,
        entity.seoDescriptionEn,
        entity.createdAt);
  }
}
