import 'package:shared_preferences/shared_preferences.dart';

abstract class PackageLocalDatasource {
  Future<void> saveSelectedPackage(String packageId);
  Future<String?> getSelectedPackage();
  Future<bool> hasActivePackage();
}

class PackageLocalDatasourceImpl implements PackageLocalDatasource {
  static const String _selectedPackageKey = 'selected_package';
  static const String _packagePurchaseDateKey = 'package_purchase_date';

  @override
  Future<void> saveSelectedPackage(String packageId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedPackageKey, packageId);
    await prefs.setInt(_packagePurchaseDateKey, DateTime.now().millisecondsSinceEpoch);
  }

  @override
  Future<String?> getSelectedPackage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_selectedPackageKey);
  }

  @override
  Future<bool> hasActivePackage() async {
    final prefs = await SharedPreferences.getInstance();
    final purchaseDate = prefs.getInt(_packagePurchaseDateKey);
    final selectedPackage = prefs.getString(_selectedPackageKey);

    if (purchaseDate == null || selectedPackage == null) {
      return false;
    }

    final purchaseDateTime = DateTime.fromMillisecondsSinceEpoch(purchaseDate);
    final now = DateTime.now();
    final difference = now.difference(purchaseDateTime);

    // Şimdilik tüm paketleri 1 aylık varsayalım
    return difference.inDays <= 30;
  }
}
