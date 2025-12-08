// features/admin/data/models/inventory_item_model.dart

class InventoryItemModel {
  final String id;
  final String name;
  final String category; // stationery, books, uniform, cleaning, equipment
  final int quantity;
  final int minQuantity;
  final String unit; // قطعة, علبة, رزمة, كتاب, طقم
  final double price;
  final DateTime lastUpdate;
  final String? supplier;
  final String? notes;

  InventoryItemModel({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.minQuantity,
    required this.unit,
    required this.price,
    required this.lastUpdate,
    this.supplier,
    this.notes,
  });

  // Check if item is low stock
  bool get isLowStock => quantity < minQuantity;

  // Calculate total value
  double get totalValue => quantity * price;

  // Get stock status
  String get stockStatus {
    if (quantity == 0) return 'نفذ';
    if (isLowStock) return 'ناقص';
    return 'متوفر';
  }

  // JSON Serialization
  factory InventoryItemModel.fromJson(Map<String, dynamic> json) {
    return InventoryItemModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      quantity: json['quantity'],
      minQuantity: json['minQuantity'],
      unit: json['unit'],
      price: json['price'].toDouble(),
      lastUpdate: DateTime.parse(json['lastUpdate']),
      supplier: json['supplier'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'quantity': quantity,
      'minQuantity': minQuantity,
      'unit': unit,
      'price': price,
      'lastUpdate': lastUpdate.toIso8601String(),
      'supplier': supplier,
      'notes': notes,
    };
  }

  // Copy With
  InventoryItemModel copyWith({
    String? id,
    String? name,
    String? category,
    int? quantity,
    int? minQuantity,
    String? unit,
    double? price,
    DateTime? lastUpdate,
    String? supplier,
    String? notes,
  }) {
    return InventoryItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      minQuantity: minQuantity ?? this.minQuantity,
      unit: unit ?? this.unit,
      price: price ?? this.price,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      supplier: supplier ?? this.supplier,
      notes: notes ?? this.notes,
    );
  }
}

class InventoryDummyData {
  static List<InventoryItemModel> getAllItems() {
    return [
      // ========== STATIONERY ==========
      InventoryItemModel(
        id: 'INV-001',
        name: 'كراسات 100 ورقة',
        category: 'stationery',
        quantity: 250,
        minQuantity: 100,
        unit: 'قطعة',
        price: 15.0,
        lastUpdate: DateTime(2025, 12, 5),
        supplier: 'شركة النهضة للأدوات المكتبية',
      ),
      InventoryItemModel(
        id: 'INV-002',
        name: 'أقلام جاف زرقاء',
        category: 'stationery',
        quantity: 45,
        minQuantity: 50,
        unit: 'علبة',
        price: 25.0,
        lastUpdate: DateTime(2025, 12, 4),
        supplier: 'شركة النهضة للأدوات المكتبية',
      ),
      InventoryItemModel(
        id: 'INV-003',
        name: 'ورق A4 (رزمة)',
        category: 'stationery',
        quantity: 30,
        minQuantity: 20,
        unit: 'رزمة',
        price: 180.0,
        lastUpdate: DateTime(2025, 12, 3),
        supplier: 'الشركة العربية للورق',
      ),
      InventoryItemModel(
        id: 'INV-004',
        name: 'أقلام رصاص HB',
        category: 'stationery',
        quantity: 180,
        minQuantity: 100,
        unit: 'قطعة',
        price: 3.0,
        lastUpdate: DateTime(2025, 12, 6),
      ),
      InventoryItemModel(
        id: 'INV-005',
        name: 'ممحاة بيضاء',
        category: 'stationery',
        quantity: 120,
        minQuantity: 80,
        unit: 'قطعة',
        price: 2.0,
        lastUpdate: DateTime(2025, 12, 6),
      ),
      InventoryItemModel(
        id: 'INV-006',
        name: 'مبراة معدنية',
        category: 'stationery',
        quantity: 65,
        minQuantity: 50,
        unit: 'قطعة',
        price: 5.0,
        lastUpdate: DateTime(2025, 12, 5),
      ),

      // ========== BOOKS ==========
      InventoryItemModel(
        id: 'INV-007',
        name: 'كتاب الرياضيات - الصف الأول',
        category: 'books',
        quantity: 180,
        minQuantity: 150,
        unit: 'كتاب',
        price: 50.0,
        lastUpdate: DateTime(2025, 12, 1),
        supplier: 'دار المعارف',
      ),
      InventoryItemModel(
        id: 'INV-008',
        name: 'كتاب العلوم - الصف الثاني',
        category: 'books',
        quantity: 160,
        minQuantity: 140,
        unit: 'كتاب',
        price: 55.0,
        lastUpdate: DateTime(2025, 12, 1),
        supplier: 'دار المعارف',
      ),
      InventoryItemModel(
        id: 'INV-009',
        name: 'كتاب اللغة العربية - الصف الثالث',
        category: 'books',
        quantity: 140,
        minQuantity: 130,
        unit: 'كتاب',
        price: 60.0,
        lastUpdate: DateTime(2025, 11, 30),
        supplier: 'دار النهضة',
      ),
      InventoryItemModel(
        id: 'INV-010',
        name: 'كتاب اللغة الإنجليزية - الصف الرابع',
        category: 'books',
        quantity: 95,
        minQuantity: 120,
        unit: 'كتاب',
        price: 70.0,
        lastUpdate: DateTime(2025, 11, 28),
        supplier: 'دار النهضة',
      ),

      // ========== UNIFORM ==========
      InventoryItemModel(
        id: 'INV-011',
        name: 'زي مدرسي - مقاس S',
        category: 'uniform',
        quantity: 40,
        minQuantity: 30,
        unit: 'طقم',
        price: 200.0,
        lastUpdate: DateTime(2025, 12, 2),
        supplier: 'مصنع الزي المدرسي',
      ),
      InventoryItemModel(
        id: 'INV-012',
        name: 'زي مدرسي - مقاس M',
        category: 'uniform',
        quantity: 25,
        minQuantity: 30,
        unit: 'طقم',
        price: 200.0,
        lastUpdate: DateTime(2025, 12, 2),
        supplier: 'مصنع الزي المدرسي',
      ),
      InventoryItemModel(
        id: 'INV-013',
        name: 'زي مدرسي - مقاس L',
        category: 'uniform',
        quantity: 35,
        minQuantity: 25,
        unit: 'طقم',
        price: 220.0,
        lastUpdate: DateTime(2025, 12, 2),
        supplier: 'مصنع الزي المدرسي',
      ),
      InventoryItemModel(
        id: 'INV-014',
        name: 'ربطة عنق مدرسية',
        category: 'uniform',
        quantity: 80,
        minQuantity: 50,
        unit: 'قطعة',
        price: 25.0,
        lastUpdate: DateTime(2025, 12, 3),
      ),

      // ========== CLEANING ==========
      InventoryItemModel(
        id: 'INV-015',
        name: 'مواد تنظيف (ديتول)',
        category: 'cleaning',
        quantity: 8,
        minQuantity: 15,
        unit: 'عبوة',
        price: 35.0,
        lastUpdate: DateTime(2025, 12, 6),
        supplier: 'شركة النظافة المتقدمة',
      ),
      InventoryItemModel(
        id: 'INV-016',
        name: 'مناديل تنظيف',
        category: 'cleaning',
        quantity: 22,
        minQuantity: 25,
        unit: 'علبة',
        price: 15.0,
        lastUpdate: DateTime(2025, 12, 5),
      ),
      InventoryItemModel(
        id: 'INV-017',
        name: 'مكانس بلاستيك',
        category: 'cleaning',
        quantity: 12,
        minQuantity: 10,
        unit: 'قطعة',
        price: 40.0,
        lastUpdate: DateTime(2025, 12, 4),
      ),
      InventoryItemModel(
        id: 'INV-018',
        name: 'أكياس قمامة كبيرة',
        category: 'cleaning',
        quantity: 5,
        minQuantity: 20,
        unit: 'رزمة',
        price: 50.0,
        lastUpdate: DateTime(2025, 12, 7),
        supplier: 'شركة النظافة المتقدمة',
      ),

      // ========== EQUIPMENT ==========
      InventoryItemModel(
        id: 'INV-019',
        name: 'سبورة بيضاء صغيرة',
        category: 'equipment',
        quantity: 8,
        minQuantity: 5,
        unit: 'قطعة',
        price: 350.0,
        lastUpdate: DateTime(2025, 11, 25),
      ),
      InventoryItemModel(
        id: 'INV-020',
        name: 'مقاعد دراسية',
        category: 'equipment',
        quantity: 3,
        minQuantity: 10,
        unit: 'قطعة',
        price: 500.0,
        lastUpdate: DateTime(2025, 11, 20),
        notes: 'يجب الطلب بشكل عاجل',
      ),
    ];
  }

  // Get items by category
  static List<InventoryItemModel> getByCategory(String category) {
    if (category == 'all') return getAllItems();
    return getAllItems().where((item) => item.category == category).toList();
  }

  // Get low stock items
  static List<InventoryItemModel> getLowStockItems() {
    return getAllItems().where((item) => item.isLowStock).toList();
  }

  // Get out of stock items
  static List<InventoryItemModel> getOutOfStockItems() {
    return getAllItems().where((item) => item.quantity == 0).toList();
  }

  // Calculate total inventory value
  static double getTotalValue() {
    return getAllItems().fold(0.0, (sum, item) => sum + item.totalValue);
  }

  // Get statistics
  static Map<String, dynamic> getStatistics() {
    final items = getAllItems();
    return {
      'total': items.length,
      'lowStock': items.where((i) => i.isLowStock).length,
      'outOfStock': items.where((i) => i.quantity == 0).length,
      'totalValue': getTotalValue(),
      'byCategory': {
        'stationery': items.where((i) => i.category == 'stationery').length,
        'books': items.where((i) => i.category == 'books').length,
        'uniform': items.where((i) => i.category == 'uniform').length,
        'cleaning': items.where((i) => i.category == 'cleaning').length,
        'equipment': items.where((i) => i.category == 'equipment').length,
      },
    };
  }
}
