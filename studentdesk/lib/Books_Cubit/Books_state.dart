class BooksState {
  final bookList;
  final bookDetails;
  BooksState(this.bookList, this.bookDetails);
}

class BooksInitial extends BooksState{
  BooksInitial(bookList, bookDetails) : super(bookList, bookDetails);
}

class LoadingBooks extends BooksState{
  LoadingBooks(bookList, bookDetails) : super(bookList, bookDetails);
}

class LoadedBookList extends BooksState{
  LoadedBookList(bookList, bookDetails) : super(bookList, bookDetails);
}

class LoadedBookdetails extends BooksState{
  LoadedBookdetails(bookList, bookDetails) : super(bookList, bookDetails);
}

