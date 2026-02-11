import 'package:flutter/material.dart';
import '../models/stock.dart';
import '../services/mock_stock_service.dart';
import '../widgets/stock_card.dart';
import 'stock_detail_screen.dart';

class StockDashboard extends StatefulWidget {
  const StockDashboard({super.key});

  @override
  State<StockDashboard> createState() => _StockDashboardState();
}

class _StockDashboardState extends State<StockDashboard> {
  List<Stock> _stocks = [];
  List<Stock> _filteredStocks = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadStocks();
  }

  void _loadStocks() {
    setState(() {
      _stocks = MockStockService.getTrendingStocks();
      _filteredStocks = _stocks;
    });
  }

  void _filterStocks(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredStocks = _stocks;
      });
    } else {
      setState(() {
        _filteredStocks = MockStockService.searchStocks(query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Research'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterStocks,
              decoration: InputDecoration(
                hintText: 'Search stocks (e.g., AAPL, Tesla)',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _filterStocks('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          
          // Stock List
          Expanded(
            child: _filteredStocks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No stocks found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredStocks.length,
                    itemBuilder: (context, index) {
                      final stock = _filteredStocks[index];
                      return StockCard(
                        stock: stock,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StockDetailScreen(stock: stock),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
