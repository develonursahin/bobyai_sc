import 'package:boby_movie_app/app/features/data/datasources/local/package_datasource.dart';
import 'package:boby_movie_app/app/features/data/models/package_model.dart';
import 'package:boby_movie_app/core/result/result.dart';

abstract class PackageRepository {
  Future<DataResult<List<PackageModel>>> getPackages();
  Future<void> saveSelectedPackage(String packageId);
  Future<bool> hasActivePackage();
}

class PackageRepositoryImpl implements PackageRepository {
  final PackageLocalDatasource _packageLocalDatasource;

  PackageRepositoryImpl({required PackageLocalDatasource packageLocalDatasource})
    : _packageLocalDatasource = packageLocalDatasource;

  @override
  Future<DataResult<List<PackageModel>>> getPackages() async {
    try {
      // Sabit paket listesi
      return SuccessDataResult(
        data: [
          PackageModel(
            id: 'weekly',
            name: 'Weekly',
            description: 'Perfect for trying',
            price: 4.99,
            durationInMonths: 0.25, // 1 hafta
            features: ['Ad-free experience', 'HD streaming'],
            isPopular: false,
          ),
          PackageModel(
            id: 'monthly',
            name: 'Monthly',
            description: 'Perfect for starters',
            price: 11.99,
            durationInMonths: 1,
            features: ['Ad-free experience', 'HD streaming', 'Download movies', 'Cancel anytime'],
            isPopular: false,
          ),
          PackageModel(
            id: 'yearly',
            name: 'Yearly',
            description: 'Most popular choice',
            price: 49.99,
            durationInMonths: 12,
            features: [
              'All Monthly features',
              '2 months free',
              'Priority support',
              'Early access to new features',
            ],
            isPopular: true,
          ),
        ],
      );
    } catch (e) {
      return ErrorDataResult(message: 'Failed to get packages');
    }
  }

  @override
  Future<void> saveSelectedPackage(String packageId) {
    return _packageLocalDatasource.saveSelectedPackage(packageId);
  }

  @override
  Future<bool> hasActivePackage() {
    return _packageLocalDatasource.hasActivePackage();
  }
}
 