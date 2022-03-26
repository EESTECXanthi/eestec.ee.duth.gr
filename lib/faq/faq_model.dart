class FaqModel {
  final Map<String, String> question;
  final Map<String, String> answer;

  const FaqModel({required this.question, required this.answer});
}

const faqs = [
  FaqModel(question: {
    "greek": "Πόσο χρόνο θα χρειαστεί να αφιερώνω;",
    "english": "How much time will I need to devote?"
  }, answer: {
    "greek":
        "Ο χρονος που θα χρειαστει να διαθέσεις εξαρτάται κυρίως από εσένα  και από τη διάθεση που έχεις να προσφέρεις στην ομάδα. Κάθε δράση μας είναι εθελοντική οπότε όσο περισσότερο ασχολείσαι με την ομάδα τόσο περισσότερο εξελίσσεσαι, μαθαίνεις και γεμίζεις με νέες εμπειρίες αναπτύσσοντας τον εαυτό σου.",
    "english":
        "The time you will need to spend depends mainly on you and the mood you have to offer the team. Each of our activities is voluntary so the more you engage with the team the more you evolve, learn and be filled with new experiences developing yourself."
  }),
  FaqModel(question: {
    "greek": "Τι είναι τα Soft Skills;",
    "english": "What are Soft Skills?"
  }, answer: {
    "greek":
        "Τα soft skills είναι οι δεξιότητες που πρέπει να έχουμε ανεξάρτητα από το επάγγελμα που κάνουμε και πλέον οι επιχειρήσεις τις τοποθετούν πολύ ψηλά ως προς τη σημαντικότητά τους. Τα soft skills αποτελούν τα προσωπικά χαρακτηριστικά και τα χαρακτηριστικά της προσωπικότητας του κάθε ατόμου και το βασικό τους χαρακτηριστικό είναι ότι μεταφέρονται από ένα οποιοδήποτε πλαίσιο σε ένα άλλο, προσωπικό, επαγγελματικό, κοινωνικό.",
    "english":
        "Soft skills are the skills that we must have regardless of the profession we do and now companies place them very high in terms of their importance. Soft skills are the personal characteristics and personality traits of each individual and their main characteristic is that they are transferred from any context to another, personal, professional, social."
  }),
  FaqModel(question: {
    "greek": "Πρέπει να έχω προηγούμενη εμπειρία;",
    "english": "Do I need to have any experience?"
  }, answer: {
    "greek":
        "Όχι , δεν χρειάζεται κάποια προηγούμενη εμπειρία , μόνο διάθεση και όρεξη τόσο για δουλειά όσο και για συνεργασία με την ομάδα αλλά και για ψυχαγωγία.Οποιαδήποτε δεξιότητα είναι απαραίτητη, μαθαίνεται μέσω Working Sessions από τον αντίστοιχο Coordinator της ομάδας.",
    "english":
        "No, you do not need any previous experience, only mood and appetite both for work and for cooperation with the team but also for entertainment. Any skill that is necessary, is learned through Working Sessions by the respective Coordinator of the team."
  }),
];
