import 'package:edugate/features/finance_report/ui/widgets/expense_breakdown.dart';
import 'package:edugate/features/finance_report/ui/widgets/finance_overview.dart';
import 'package:edugate/features/finance_report/ui/widgets/income_breakdown.dart';
import 'package:edugate/features/finance_report/ui/widgets/payment_status.dart';
import 'package:edugate/features/finance_report/ui/widgets/period_selector.dart';
import 'package:flutter/material.dart';

class FinancialReportsScreen extends StatefulWidget {
  const FinancialReportsScreen({super.key});

  @override
  State<FinancialReportsScreen> createState() => _FinancialReportsScreenState();
}

class _FinancialReportsScreenState extends State<FinancialReportsScreen> {
  String _selectedPeriod = 'month';
  DateTime _startDate = DateTime.now().subtract(Duration(days: 30));
  DateTime _endDate = DateTime.now();

  // Sample Data
  final double _totalIncome = 245000;
  final double _totalExpenses = 128000;
  final double _netProfit = 117000;
  final int _paidStudents = 314;
  final int _pendingPayments = 28;
  final double _pendingAmount = 68000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C3AED),
        elevation: 0,
        title: Text(
          'التقارير المالية',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.download, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('جاري تصدير التقرير...')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PeriodSelectorWidget(
              selectedPeriod: _selectedPeriod,
              startDate: _startDate,
              endDate: _endDate,
              onPeriodChanged: (period, start, end) {
                setState(() {
                  _selectedPeriod = period;
                  _startDate = start;
                  _endDate = end;
                });
              },
            ),
            FinancialOverviewWidget(
              totalIncome: _totalIncome,
              totalExpenses: _totalExpenses,
              netProfit: _netProfit,
            ),
            IncomeBreakdownWidget(totalIncome: _totalIncome),
            ExpensesBreakdownWidget(totalExpenses: _totalExpenses),
            PaymentStatusWidget(
              paidStudents: _paidStudents,
              pendingPayments: _pendingPayments,
              pendingAmount: _pendingAmount,
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}






