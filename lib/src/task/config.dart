//<script>
//// Initialize Firebase
//var config = {
//  apiKey: "AIzaSyA5diRgB3T3v9EKjVGtHt_sv7nuR4cWQyc",
//  authDomain: "test-f45b6.firebaseapp.com",
//  databaseURL: "https://test-f45b6.firebaseio.com",
//  projectId: "test-f45b6",
//  storageBucket: "test-f45b6.appspot.com",
//  messagingSenderId: "678173951817"
//};
//firebase.initializeApp(config);
//</script>


class Config {
  final String apiKey;
  final String authDomain;
  final String databaseURL;
  final String projectId;
  final String storageBucket;
  final String messagingSenderId;

  Config(
      this.apiKey,
      this.authDomain,
      this.databaseURL,
      this.projectId,
      this.storageBucket,
      this.messagingSenderId
      );
}