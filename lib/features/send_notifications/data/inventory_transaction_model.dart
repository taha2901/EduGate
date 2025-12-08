// features/admin/data/models/inventory_transaction_model.dart

class InventoryTransactionModel {
  final String id;
  final String itemId;
  final String itemName;
  final String transactionType; // add, remove, update, adjust
  final int quantityBefore;
  final int quantityAfter;
  // final int quantityChange;
  final String? reason;
  final String performedBy;
  final DateTime timestamp;

  InventoryTransactionModel({
    required this.id,
    required this.itemId,
    required this.itemName,
    required this.transactionType,
    required this.quantityBefore,
    required this.quantityAfter,
    this.reason,
    required this.performedBy,
    required this.timestamp,
  });

  int get quantityChange => quantityAfter - quantityBefore;

  String get transactionTypeLabel {
    switch (transactionType) {
      case 'add':
        return 'إضافة';
      case 'remove':
        return 'سحب';
      case 'update':
        return 'تحديث';
      case 'adjust':
        return 'تعديل';
      default:
        return transactionType;
    }
  }

  factory InventoryTransactionModel.fromJson(Map<String, dynamic> json) {
    return InventoryTransactionModel(
      id: json['id'],
      itemId: json['itemId'],
      itemName: json['itemName'],
      transactionType: json['transactionType'],
      quantityBefore: json['quantityBefore'],
      quantityAfter: json['quantityAfter'],
      reason: json['reason'],
      performedBy: json['performedBy'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'itemId': itemId,
      'itemName': itemName,
      'transactionType': transactionType,
      'quantityBefore': quantityBefore,
      'quantityAfter': quantityAfter,
      'reason': reason,
      'performedBy': performedBy,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
