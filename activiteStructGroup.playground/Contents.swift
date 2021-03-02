struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
}

var firstBook: Book
firstBook = Book(title: "Les 3 mousquetaires",
                  author: "Alexandre Dumas",
                  pages: 200,
                  price: 21.99)

var secondBook: Book
secondBook = Book(title: "Petit pays",
                  author: "Gaël Faye",
                  pages: 150,
                  price: 9.99)


var tableauDeLivres = [firstBook, secondBook]

func displayBook (unLivre:Book) {
    print(unLivre.author)
}

//displayBook(unLivre: firstBook)

func displayBookStore (listeDeLivre: [Book]){
    for livre in listeDeLivre {
        displayBook(unLivre: livre)
    }
}

displayBookStore(listeDeLivre: tableauDeLivres)
