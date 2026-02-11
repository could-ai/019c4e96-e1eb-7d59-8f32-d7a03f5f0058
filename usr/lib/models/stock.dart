class Stock {
  final String symbol;
  final String name;
  final double price;
  final double change;
  final double changePercent;
  final String marketCap;
  final double peRatio;
  final double dividendYield;
  final String description;
  final String sector;
  final String analystRating; // Buy, Hold, Sell

  Stock({
    required this.symbol,
    required this.name,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.marketCap,
    required this.peRatio,
    required this.dividendYield,
    required this.description,
    required this.sector,
    required this.analystRating,
  });
}
