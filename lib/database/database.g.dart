// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ItemDAO? _itemDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProductItem` (`id` INTEGER NOT NULL, `image` TEXT NOT NULL, `name` TEXT NOT NULL, `category` TEXT NOT NULL, `price` TEXT NOT NULL, `quantity` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ItemDAO get itemDAO {
    return _itemDAOInstance ??= _$ItemDAO(database, changeListener);
  }
}

class _$ItemDAO extends ItemDAO {
  _$ItemDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _productItemInsertionAdapter = InsertionAdapter(
            database,
            'ProductItem',
            (ProductItem item) => <String, Object?>{
                  'id': item.id,
                  'image': item.image,
                  'name': item.name,
                  'category': item.category,
                  'price': item.price,
                  'quantity': item.quantity
                }),
        _productItemUpdateAdapter = UpdateAdapter(
            database,
            'ProductItem',
            ['id'],
            (ProductItem item) => <String, Object?>{
                  'id': item.id,
                  'image': item.image,
                  'name': item.name,
                  'category': item.category,
                  'price': item.price,
                  'quantity': item.quantity
                }),
        _productItemDeletionAdapter = DeletionAdapter(
            database,
            'ProductItem',
            ['id'],
            (ProductItem item) => <String, Object?>{
                  'id': item.id,
                  'image': item.image,
                  'name': item.name,
                  'category': item.category,
                  'price': item.price,
                  'quantity': item.quantity
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProductItem> _productItemInsertionAdapter;

  final UpdateAdapter<ProductItem> _productItemUpdateAdapter;

  final DeletionAdapter<ProductItem> _productItemDeletionAdapter;

  @override
  Future<List<ProductItem>> getAllItems() async {
    return _queryAdapter.queryList('SELECT * FROM ProductItem',
        mapper: (Map<String, Object?> row) => ProductItem(
            row['id'] as int,
            row['image'] as String,
            row['name'] as String,
            row['quantity'] as int,
            row['price'] as String,
            row['category'] as String));
  }

  @override
  Future<List<ProductItem>> getAllItemsByCategory(String category) async {
    return _queryAdapter.queryList(
        'SELECT * FROM ProductItem WHERE category =?1',
        mapper: (Map<String, Object?> row) => ProductItem(
            row['id'] as int,
            row['image'] as String,
            row['name'] as String,
            row['quantity'] as int,
            row['price'] as String,
            row['category'] as String),
        arguments: [category]);
  }

  @override
  Future<void> deleteAllItem() async {
    await _queryAdapter.queryNoReturn('DELETE FROM ProductItem');
  }

  @override
  Future<void> insertItem(ProductItem productItem) async {
    await _productItemInsertionAdapter.insert(
        productItem, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateItem(ProductItem productItem) async {
    await _productItemUpdateAdapter.update(
        productItem, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteItem(ProductItem productItem) async {
    await _productItemDeletionAdapter.delete(productItem);
  }
}
