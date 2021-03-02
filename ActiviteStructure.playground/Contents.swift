struct Livre {
    var title: String
    var author: String
    var pages: Int
    var price: Double
}

var dumaTrois: Livre
dumaTrois = Livre(title: "Les 3 mousquetaires",
                  author: "Alexandre Dumas",
                  pages: 200,
                  price: 21.99)

var fayePetit: Livre
fayePetit = Livre(title: "Petit pays",
                  author: "Gaël Faye",
                  pages: 150,
                  price: 9.99)

var orwe19: Livre
orwe19 = Livre(title: "1984",
               author: "George Orwell",
               pages: 100,
               price: 6.99)

var bibliotheque: [Livre] = []

bibliotheque.append(dumaTrois)
bibliotheque.append(fayePetit)
bibliotheque.append(orwe19)

var camuEtra: Livre
camuEtra = Livre(title: "L'Étranger", author: "Albert Camus", pages: 159, price: 5.99)
bibliotheque.append(camuEtra)
var boccDeca: Livre
boccDeca = Livre(title: "Décaméron", author: "Boccace", pages: 1056, price: 12.90)
bibliotheque.append(boccDeca)
var hemiViei: Livre
hemiViei = Livre(title: "Le Vieil Homme et la Mer", author: "Ernest Hemingway", pages: 191, price: 8.54)
bibliotheque.append(hemiViei)

/* to show Euro symbole */
import Foundation

func getSymbolForCurrencyCode(code: String) -> String?
{
  let locale = NSLocale(localeIdentifier: code)
  return locale.displayName(forKey: NSLocale.Key.currencySymbol, value: code)
}
let euro = getSymbolForCurrencyCode(code: "EUR")!
/* */

/*
for book in bibliotheque {
    print("Le title de livre est \(book.title) ecrit par \(book.author). Il coute \(book.price) \(euro).")
}
 */

func displayBook(book: Livre) {
    print("Le title de livre est \(book.title) ecrit par \(book.author). Il coute \(book.price) \(euro).")
}

//displayBook(book: dumaTrois)

func displayBookstore(bookstore: [Livre]) {
    for unLivre in bookstore {
        displayBook(book: unLivre)
    }
}

//displayBookstore(bookstore: bibliotheque)

func displayDiscount(bookstore: [Livre], prixMax: Double = Double.greatestFiniteMagnitude) {
    for unLivre in bookstore {
        if unLivre.price < prixMax {
            displayBook(book: unLivre)
        }
    }
}

//displayDiscount(bookstore: bibliotheque, prixMax: 10.0)
displayDiscount(bookstore: bibliotheque)

