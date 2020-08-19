class BooksState {
  final bookList;
  BooksState(this.bookList);
}

class BooksInitial extends BooksState{
  BooksInitial(bookList) : super(bookList);
}

class LoadingBooks extends BooksState{
  LoadingBooks(bookList) : super(bookList);
}

class LoadedBookList extends BooksState{
  LoadedBookList(bookList) : super(bookList);
}