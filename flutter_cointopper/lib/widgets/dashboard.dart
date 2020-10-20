import 'package:flutter/material.dart'; 

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.blue[800], Colors.blue[400]],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome to Cointopper",
                  style: TextStyle(fontSize: 18, color: Colors.white60),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Crypto M.CAP",
                        style: TextStyle(fontSize: 16, color: Colors.white60)),
                    Text("\$207.00 B",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Cryptocurrencies",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  child: TextField(
                    style: TextStyle(fontSize: 22.0, color: Colors.white60),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 14.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Color(0xFF00e00),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'USD',
                    style: TextStyle(fontSize: 18, color: Colors.white60),
                  ),
                ), 
                Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Color(0xFF00e00),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.star_border,color: Colors.white60, ),
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Color(0xFF00e00),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_active,color: Colors.white60,),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
