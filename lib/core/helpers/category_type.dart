enum CategoryType {
  unKnown(null),
  pharmaceutical(1),
  hairCare(2),
  medicalSupplies(3),
  motherAndChild(4),
  dailyCare(5);

  const CategoryType(this.value);

  final int? value;

  factory CategoryType.fromNullableInt(int? nullableInt) =>
      switch (nullableInt) {
        1 => CategoryType.pharmaceutical,
        2 => CategoryType.hairCare,
        3 => CategoryType.medicalSupplies,
        4 => CategoryType.motherAndChild,
        5 => CategoryType.dailyCare,
        _ => CategoryType.unKnown,
      };
}
