class Breed {
  String breed;
  String breedListDescription;
  String breedListImage;

  String breedPageImage;
  String breedPageLifespan;
  String breedPageShortHistory;

  String breedPageFriendlinessNumber;
  String breedPageFriendlinessText;
  String breedPageActivityNumber;
  String breedPageActivityText;

  String breedPageSize;
  String breedPagePersonality;
  String breedPageHealth;
  String breedPageCare;
  String breedPageFeeding;
  String breedPageGrooming;
  String breedPageBehaviour;

  Breed(
      this.breed,
      this.breedListDescription,
      this.breedListImage,

      this.breedPageImage,
      this.breedPageLifespan,
      this.breedPageShortHistory,

      this.breedPageFriendlinessNumber,
      this.breedPageFriendlinessText,
      this.breedPageActivityNumber,
      this.breedPageActivityText,

      this.breedPageSize,
      this.breedPagePersonality,
      this.breedPageHealth,
      this.breedPageCare,
      this.breedPageFeeding,
      this.breedPageGrooming,
      this.breedPageBehaviour);

  Breed.fromJson(Map<String, dynamic> json) {
    breed = json['breed'];
    breedListDescription = json['breedListDescription'];
    breedListImage = json['breedListImage'];

    breedPageImage = json['breedPageImage'];
    breedPageLifespan = json['breedPageLifespan'];
    breedPageShortHistory = json['breedPageShortHistory'];

    breedPageFriendlinessNumber = json['breedPageFriendlinessNumber'];
    breedPageFriendlinessText = json['breedPageFriendlinessText'];

    breedPageActivityNumber = json['breedPageActivityNumber'];
    breedPageActivityText = json['breedPageActivityText'];

    breedPageSize = json['breedPageSize'];
    breedPagePersonality = json['breedPagePersonality'];
    breedPageHealth = json['breedPageHealth'];
    breedPageCare = json['breedPageCare'];
    breedPageFeeding = json['breedPageFeeding'];
    breedPageGrooming = json['breedPageGrooming'];
    breedPageBehaviour = json['breedPageBehaviour'];
  }
}
