

T _$identity<T>(T value) => value;
Pet _$PetFromJson(Map<String, dynamic> json) {
  return _Pet.fromJson(json);
}

/// @nodoc
class _$PetTearOff {
  const _$PetTearOff();

// ignore: unused_element
  _Pet call(
      {String petId,
      String petName,
      String userId,
      String imageUrl,
      String age,
      String weight,
      String gender,
      PetCategory petType,
      PetBreed breed}) {
    return _Pet(
      petId: petId,
      petName: petName,
      userId: userId,
      imageUrl: imageUrl,
      age: age,
      weight: weight,
      gender: gender,
      petType: petType,
      breed: breed,
    );
  }

// ignore: unused_element
  Pet fromJson(Map<String, Object> json) {
    return Pet.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Pet = _$PetTearOff();

/// @nodoc
mixin _$Pet {
  String get petId;
  String get petName;
  String get userId;
  String get imageUrl;
  String get age;
  String get weight;
  String get gender;
  PetCategory get petType;
  PetBreed get breed;

  Map<String, dynamic> toJson();
  $PetCopyWith<Pet> get copyWith;
}

/// @nodoc
abstract class $PetCopyWith<$Res> {
  factory $PetCopyWith(Pet value, $Res Function(Pet) then) =
      _$PetCopyWithImpl<$Res>;
  $Res call(
      {String petId,
      String petName,
      String userId,
      String imageUrl,
      String age,
      String weight,
      String gender,
      PetCategory petType,
      PetBreed breed});

  $PetCategoryCopyWith<$Res> get petType;
  $PetBreedCopyWith<$Res> get breed;
}

/// @nodoc
class _$PetCopyWithImpl<$Res> implements $PetCopyWith<$Res> {
  _$PetCopyWithImpl(this._value, this._then);

  final Pet _value;
  // ignore: unused_field
  final $Res Function(Pet) _then;

  @override
  $Res call({
    Object petId = freezed,
    Object petName = freezed,
    Object userId = freezed,
    Object imageUrl = freezed,
    Object age = freezed,
    Object weight = freezed,
    Object gender = freezed,
    Object petType = freezed,
    Object breed = freezed,
  }) {
    return _then(_value.copyWith(
      petId: petId == freezed ? _value.petId : petId as String,
      petName: petName == freezed ? _value.petName : petName as String,
      userId: userId == freezed ? _value.userId : userId as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      age: age == freezed ? _value.age : age as String,
      weight: weight == freezed ? _value.weight : weight as String,
      gender: gender == freezed ? _value.gender : gender as String,
      petType: petType == freezed ? _value.petType : petType as PetCategory,
      breed: breed == freezed ? _value.breed : breed as PetBreed,
    ));
  }

  @override
  $PetCategoryCopyWith<$Res> get petType {
    if (_value.petType == null) {
      return null;
    }
    return $PetCategoryCopyWith<$Res>(_value.petType, (value) {
      return _then(_value.copyWith(petType: value));
    });
  }

  @override
  $PetBreedCopyWith<$Res> get breed {
    if (_value.breed == null) {
      return null;
    }
    return $PetBreedCopyWith<$Res>(_value.breed, (value) {
      return _then(_value.copyWith(breed: value));
    });
  }
}

/// @nodoc
abstract class _$PetCopyWith<$Res> implements $PetCopyWith<$Res> {
  factory _$PetCopyWith(_Pet value, $Res Function(_Pet) then) =
      __$PetCopyWithImpl<$Res>;
  @override
  $Res call(
      {String petId,
      String petName,
      String userId,
      String imageUrl,
      String age,
      String weight,
      String gender,
      PetCategory petType,
      PetBreed breed});

  @override
  $PetCategoryCopyWith<$Res> get petType;
  @override
  $PetBreedCopyWith<$Res> get breed;
}

/// @nodoc
class __$PetCopyWithImpl<$Res> extends _$PetCopyWithImpl<$Res>
    implements _$PetCopyWith<$Res> {
  __$PetCopyWithImpl(_Pet _value, $Res Function(_Pet) _then)
      : super(_value, (v) => _then(v as _Pet));

  @override
  _Pet get _value => super._value as _Pet;

  @override
  $Res call({
    Object petId = freezed,
    Object petName = freezed,
    Object userId = freezed,
    Object imageUrl = freezed,
    Object age = freezed,
    Object weight = freezed,
    Object gender = freezed,
    Object petType = freezed,
    Object breed = freezed,
  }) {
    return _then(_Pet(
      petId: petId == freezed ? _value.petId : petId as String,
      petName: petName == freezed ? _value.petName : petName as String,
      userId: userId == freezed ? _value.userId : userId as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      age: age == freezed ? _value.age : age as String,
      weight: weight == freezed ? _value.weight : weight as String,
      gender: gender == freezed ? _value.gender : gender as String,
      petType: petType == freezed ? _value.petType : petType as PetCategory,
      breed: breed == freezed ? _value.breed : breed as PetBreed,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Pet implements _Pet {
  const _$_Pet(
      {this.petId,
      this.petName,
      this.userId,
      this.imageUrl,
      this.age,
      this.weight,
      this.gender,
      this.petType,
      this.breed});

  factory _$_Pet.fromJson(Map<String, dynamic> json) => _$_$_PetFromJson(json);

  @override
  final String petId;
  @override
  final String petName;
  @override
  final String userId;
  @override
  final String imageUrl;
  @override
  final String age;
  @override
  final String weight;
  @override
  final String gender;
  @override
  final PetCategory petType;
  @override
  final PetBreed breed;

  @override
  String toString() {
    return 'Pet(petId: $petId, petName: $petName, userId: $userId, imageUrl: $imageUrl, age: $age, weight: $weight, gender: $gender, petType: $petType, breed: $breed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Pet &&
            (identical(other.petId, petId) ||
                const DeepCollectionEquality().equals(other.petId, petId)) &&
            (identical(other.petName, petName) ||
                const DeepCollectionEquality()
                    .equals(other.petName, petName)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.petType, petType) ||
                const DeepCollectionEquality()
                    .equals(other.petType, petType)) &&
            (identical(other.breed, breed) ||
                const DeepCollectionEquality().equals(other.breed, breed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(petId) ^
      const DeepCollectionEquality().hash(petName) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(weight) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(petType) ^
      const DeepCollectionEquality().hash(breed);

  @override
  _$PetCopyWith<_Pet> get copyWith =>
      __$PetCopyWithImpl<_Pet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PetToJson(this);
  }
}

abstract class _Pet implements Pet {
  const factory _Pet(
      {String petId,
      String petName,
      String userId,
      String imageUrl,
      String age,
      String weight,
      String gender,
      PetCategory petType,
      PetBreed breed}) = _$_Pet;

  factory _Pet.fromJson(Map<String, dynamic> json) = _$_Pet.fromJson;

  @override
  String get petId;
  @override
  String get petName;
  @override
  String get userId;
  @override
  String get imageUrl;
  @override
  String get age;
  @override
  String get weight;
  @override
  String get gender;
  @override
  PetCategory get petType;
  @override
  PetBreed get breed;
  @override
  _$PetCopyWith<_Pet> get copyWith;
}

PetCategory _$PetCategoryFromJson(Map<String, dynamic> json) {
  return _PetCategory.fromJson(json);
}

/// @nodoc
class _$PetCategoryTearOff {
  const _$PetCategoryTearOff();

// ignore: unused_element
  _PetCategory call({String petCategoryId, String name}) {
    return _PetCategory(
      petCategoryId: petCategoryId,
      name: name,
    );
  }

// ignore: unused_element
  PetCategory fromJson(Map<String, Object> json) {
    return PetCategory.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PetCategory = _$PetCategoryTearOff();

/// @nodoc
mixin _$PetCategory {
  String get petCategoryId;
  String get name;

  Map<String, dynamic> toJson();
  $PetCategoryCopyWith<PetCategory> get copyWith;
}

/// @nodoc
abstract class $PetCategoryCopyWith<$Res> {
  factory $PetCategoryCopyWith(
          PetCategory value, $Res Function(PetCategory) then) =
      _$PetCategoryCopyWithImpl<$Res>;
  $Res call({String petCategoryId, String name});
}

/// @nodoc
class _$PetCategoryCopyWithImpl<$Res> implements $PetCategoryCopyWith<$Res> {
  _$PetCategoryCopyWithImpl(this._value, this._then);

  final PetCategory _value;
  // ignore: unused_field
  final $Res Function(PetCategory) _then;
