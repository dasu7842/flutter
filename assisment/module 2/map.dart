
//Create a program using Map.
void main()
{
  Map<String,int> mydata =
  {
    "India" : 91,
    "USA" : 1,
    "ENGLAND" : 44
  };

  Map<String,String> details = Map();

  details["apple"] = "red";
  details["banana"] = "yellow";
  details["guava"]  = "green";

  print(mydata);
  print(details);
  print(mydata.length);
  print(details.keys);
  print(details.values);
  print(mydata.isEmpty);
  print(details.containsKey("apple"));
  print(details.update("apple", (value) => "green"));
  print(details);

  details.remove("apple");
  print(details);


  for (String key in details.keys) {           // Print all keys
    print(key);
  }

}
