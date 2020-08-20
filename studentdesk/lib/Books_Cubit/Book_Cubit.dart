import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:studentdesk/Books_Cubit/Books_state.dart';


// Cubit for Books API.

class BooksCubit extends Cubit<BooksState>{
  BooksCubit() : super(BooksInitial(null,null));

  Future<void> getBookList() async {
      emit(LoadingBooks(null,null));
      var response = await http
          .get("http://studentdesk.in/api/v1/newarrivals?&apiname=newArrivals");
      emit(LoadedBookList(jsonDecode(response.body)["data"],null)); // We pass second argument as null because we don't need details data for this.
    }

  Future<void> getBookDetails(bookid) async {
    emit(LoadingBooks(null,null));
    var response =
    await http.get("http://studentdesk.in/api/v1/book-details/$bookid");
    emit(LoadedBookdetails(null,jsonDecode(response.body)["data"][0]));// We pass first argument as null because we don't need booklist data for this.
  }

  @override
  void onChange(Change<dynamic> change) {
    print(change);
    super.onChange(change);
  } //This will print state change.
}