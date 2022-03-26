class ArticleModel {
  final String title;
  final String? subtitle;
  final String image;
  final String link;

  const ArticleModel(
      {required this.title,
      this.subtitle,
      required this.link,
      required this.image});
}

const List<ArticleModel> articles = [
  ArticleModel(
    title: "Η 1η ΦΩΤΟΓΡΑΦΙΑ ΜΑΥΡΗΣ ΤΡΥΠΑΣ ΛΕΕΙ ΜΠΡΑΒΟ ΑΙΝΣΤΑΙΝ!",
    link:
        "https://www.lam-lab.com/epistimonika-nea/texnologia-diastima/i-1i-fotografia-mayris-trypas-leei-mpravo-ainstain/",
    image:
        "data:image/jpeg;base64,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",
  ),
  ArticleModel(
    title:
        "Σύστημα τεχνητής νοημοσύνης «διαβάζει» στα μάτια τον κίνδυνο εμφράγματος",
    subtitle: "Τα μάτια μας «παράθυρο» για την πρόβλεψη εμφράγματος",
    link:
        "https://www.tanea.gr/2022/01/28/science-technology/systima-texnitis-noimosynis-diavazei-sta-matia-ton-kindyno-emfragmatos/",
    image:
        "https://images.ctfassets.net/u4vv676b8z52/3DGAAIEOlBVIFBuekYpXgd/485ce8a9135d7dc5a646a712dcec2c29/hazel-eye-678x446-compressor.jpg?fm=jpg&q=80",
  ),
  // ArticleModel(
  //   title: "...",
  //   subtitle: "«Το κλειδί» και τα προβλήματα",
  //   image:
  //       "https://www.tanea.gr/wp-content/uploads/2021/04/texniti-noimosini_iefimerida.jpg",
  //   link: "...",
  // ),
];
