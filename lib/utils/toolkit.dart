class Toolkit {
  formatNum(double num, int postion) {
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        postion) {
      //how many numbers after .
      print(num.toStringAsFixed(postion)
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    } else {
      print(num.toString()
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    }
  }

  formatTime() {
    DateTime today = new DateTime.now();
    String dateSlug =
        "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    print(dateSlug);
    return dateSlug;
  }

  // _getInternetData() async {
  //   var url =
  //       'https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=BTC&to_currency=USD&apikey=9AAGEESEANSVTYTV';
  //   var httpClient = new HttpClient();

  //   //String result;
  //   try {
  //     var request = await httpClient.getUrl(Uri.parse(url));
  //     var response = await request.close();
  //     print('start');
  //     if (response.statusCode == HttpStatus.ok) {
  //       var json = await response.transform(utf8.decoder).join();
  //       var data = jsonDecode(json);
  //       return data;
  //     } else {
  //       print('Error getting data:\nHttp status ${response.statusCode}');
  //       return response.statusCode;
  //     }
  //   } catch (exception) {
  //     print('Failed getting data');
  //     return 'Failed getting data';
  //   }
  // }
}
