class ReviewModel {
  String? productReviewId;
  String? productId;
  String? reviewerId;
  String? reviewerName;
  Null? reviewerImage;
  String? comments;
  String? rate;
  String? createdAt;

  ReviewModel(
      {this.productReviewId,
        this.productId,
        this.reviewerId,
        this.reviewerName,
        this.reviewerImage,
        this.comments,
        this.rate,
        this.createdAt});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    productReviewId = json['product_review_id'];
    productId = json['product_id'];
    reviewerId = json['reviewer_id'];
    reviewerName = json['reviewer_name'];
    reviewerImage = json['reviewer_image'];
    comments = json['comments'];
    rate = json['rate'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_review_id'] = this.productReviewId;
    data['product_id'] = this.productId;
    data['reviewer_id'] = this.reviewerId;
    data['reviewer_name'] = this.reviewerName;
    data['reviewer_image'] = this.reviewerImage;
    data['comments'] = this.comments;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    return data;
  }
}