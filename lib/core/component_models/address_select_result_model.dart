class AddressSelectResultModel {
  int provinceID = 0;
  int districtID = 0;
  int neighborhoodID = 0;

  @override
  String toString() {
    return "İl $provinceID ilçe $districtID mahalle $neighborhoodID ";
  }
}
