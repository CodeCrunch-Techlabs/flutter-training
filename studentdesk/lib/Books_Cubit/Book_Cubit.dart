import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:studentdesk/Books_Cubit/Books_state.dart';

class BooksCubit extends Cubit<BooksState>{
  BooksCubit() : super(BooksInitial(null,null));

  Future<void> getBookList() async {
      emit(LoadingBooks(null,null));
      var response = await http
          .get("http://studentdesk.in/api/v1/newarrivals?&apiname=newArrivals");
      emit(LoadedBookList(jsonDecode(response.body)["data"],null));
    }

  Future<void> getBookDetails(bookid) async {
    emit(LoadingBooks(null,null));
    var response =
    await http.get("http://studentdesk.in/api/v1/book-details/$bookid");
    emit(LoadedBookdetails(null,jsonDecode(response.body)["data"][0]));
  }

  @override
  void onChange(Change<dynamic> change) {
    print(change);
    super.onChange(change);
  }
}