import '../models/stock.dart';

class MockStockService {
  static final List<Stock> _stocks = [
    Stock(
      symbol: 'AAPL',
      name: 'Apple Inc.',
      price: 175.43,
      change: 2.15,
      changePercent: 1.24,
      marketCap: '2.7T',
      peRatio: 28.5,
      dividendYield: 0.55,
      description: 'Apple Inc. designs, manufactures, and markets smartphones, personal computers, tablets, wearables, and accessories worldwide.',
      sector: 'Technology',
      analystRating: 'Buy',
    ),
    Stock(
      symbol: 'MSFT',
      name: 'Microsoft Corporation',
      price: 332.89,
      change: -1.20,
      changePercent: -0.36,
      marketCap: '2.5T',
      peRatio: 32.1,
      dividendYield: 0.88,
      description: 'Microsoft Corporation develops, licenses, and supports software, services, devices, and solutions worldwide.',
      sector: 'Technology',
      analystRating: 'Strong Buy',
    ),
    Stock(
      symbol: 'GOOGL',
      name: 'Alphabet Inc.',
      price: 138.21,
      change: 0.85,
      changePercent: 0.62,
      marketCap: '1.7T',
      peRatio: 24.3,
      dividendYield: 0.0,
      description: 'Alphabet Inc. offers various products and platforms in the United States, Europe, the Middle East, Africa, the Asia-Pacific, Canada, and Latin America.',
      sector: 'Communication Services',
      analystRating: 'Buy',
    ),
    Stock(
      symbol: 'AMZN',
      name: 'Amazon.com, Inc.',
      price: 129.12,
      change: -0.45,
      changePercent: -0.35,
      marketCap: '1.3T',
      peRatio: 65.2,
      dividendYield: 0.0,
      description: 'Amazon.com, Inc. engages in the retail sale of consumer products and subscriptions in North America and internationally.',
      sector: 'Consumer Cyclical',
      analystRating: 'Buy',
    ),
    Stock(
      symbol: 'TSLA',
      name: 'Tesla, Inc.',
      price: 245.34,
      change: 5.67,
      changePercent: 2.36,
      marketCap: '780B',
      peRatio: 72.4,
      dividendYield: 0.0,
      description: 'Tesla, Inc. designs, develops, manufactures, leases, and sells electric vehicles, and energy generation and storage systems in the United States, China, and internationally.',
      sector: 'Consumer Cyclical',
      analystRating: 'Hold',
    ),
    Stock(
      symbol: 'JPM',
      name: 'JPMorgan Chase & Co.',
      price: 148.55,
      change: 1.12,
      changePercent: 0.76,
      marketCap: '430B',
      peRatio: 9.8,
      dividendYield: 2.95,
      description: 'JPMorgan Chase & Co. operates as a financial services company worldwide.',
      sector: 'Financial Services',
      analystRating: 'Buy',
    ),
    Stock(
      symbol: 'JNJ',
      name: 'Johnson & Johnson',
      price: 155.23,
      change: -0.34,
      changePercent: -0.22,
      marketCap: '400B',
      peRatio: 33.5,
      dividendYield: 3.05,
      description: 'Johnson & Johnson researches and develops, manufactures, and sells various products in the healthcare field worldwide.',
      sector: 'Healthcare',
      analystRating: 'Hold',
    ),
    Stock(
      symbol: 'V',
      name: 'Visa Inc.',
      price: 240.12,
      change: 1.45,
      changePercent: 0.61,
      marketCap: '500B',
      peRatio: 30.2,
      dividendYield: 0.75,
      description: 'Visa Inc. operates as a payments technology company worldwide.',
      sector: 'Financial Services',
      analystRating: 'Buy',
    ),
  ];

  static List<Stock> getTrendingStocks() {
    return _stocks;
  }

  static List<Stock> searchStocks(String query) {
    if (query.isEmpty) return [];
    return _stocks.where((stock) =>
      stock.symbol.toLowerCase().contains(query.toLowerCase()) ||
      stock.name.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  static Stock getStockBySymbol(String symbol) {
    return _stocks.firstWhere((stock) => stock.symbol == symbol, orElse: () => _stocks.first);
  }
}
