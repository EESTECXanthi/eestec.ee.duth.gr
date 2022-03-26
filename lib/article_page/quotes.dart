class Quote {
  final String quote;

  final String author;

  const Quote({required this.quote, required this.author});
}

const List<Quote> quotes = [
  Quote(
    quote: "Science isn't about WHY, it's about WHY NOT!",
    author: "J.K. Simmons",
  ),
  Quote(
      quote: "Once you stop learning you start dying",
      author: "Albert Einstein"),
  Quote(
      quote: "The science of today is the technology of tomorrow.",
      author: "Edward Teller"),
  Quote(quote: "Science is nothing but perception.", author: "Plato"),
  Quote(quote: "Leave the atom alone.", author: "E. Y. Harburg"),
  Quote(quote: "Science is organized knowledge.", author: "Herbert Spencer"),
  Quote(
      quote:
          "If science is to progress, what we need is the ability to experiment.",
      author: "Richard P. Feynman"),
  Quote(
      quote: "Somewhere, something incredible is waiting to be known.",
      author: "Carl Sagan"),
  Quote(
      quote: "Science is organized knowledge. Wisdom is organized life.",
      author: "Immanuel Kant")
];
