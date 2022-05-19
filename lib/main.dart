import 'package:flutter/material.dart';

void main() {
  runApp(const NumberApp());
}

class NumberApp extends StatelessWidget {
  const NumberApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _tab = <Tab> [
    Tab( text: "1 Number" ),
    Tab( text: "2 Numbers"),
    Tab( text: "3 Numbers"),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          bottom: TabBar(
            tabs: _tab,
          ),
        ),
        body: TabBarView(
          children: <Widget> [
            TabPage(ttl: "1 Number"),
            TabPage(ttl: "2 Numbers"),
            TabPage(ttl: "3 Numbers"),
          ],
        ),
      ),
    );

  }

}

class TabPage extends StatefulWidget {
  const TabPage({Key? key, required this.ttl}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String ttl;

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  //final String? title;

  int _num = 0;
  int _num2 = 0;
  int _num3 = 0;
  int _gValue = 1;
  int _gValue1 = 11;
  int _gValue2 = 21;
  String _text = '';
  String _text2 = '';
  String _text3 = '';
  String _result = '';

  _onRadioSelected(value) {
    setState(() {
      _gValue = value;
    });
  }

  _onRadioSelected1(value) {
    setState(() {
      _gValue1 = value;
    });
  }

  _onRadioSelected2(value) {
    setState(() {
      _gValue2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.ttl) {
      case "1 Number":
        return SingleChildScrollView(
          padding: EdgeInsets.all(64),
          child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: new InputDecoration(labelText: "Number"),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        setState(() {
                          _text = value;
                          _num = int.parse(_text);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    RadioListTile(
                      title: Text('Check if this is prime or not'),
                      value: 1,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('Get divisors of this'),
                      value: 2,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('Prime factorize this'),
                      value: 3,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('Calculate the factorial of this'),
                      value: 4,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('Calculate the harmonic number of this'),
                      value: 5,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    switch(_gValue) {
                      case 1:
                        if(_num < 1) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('Invalid number'),
                                content: Text('Number must be positive.'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () => Navigator.of(context).pop(0),
                                  ),
                                ],
                              );
                            });
                        } else {
                          _result = PrimeOrNot(_num);
                        }
                        break;
                      case 2:
                        if(_num < 1) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('Invalid number'),
                                content: Text('Number must be positive.'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () => Navigator.of(context).pop(0),
                                  ),
                                ],
                              );
                            });
                        } else {
                          _result = GetDivisors(_num);
                        }
                        break;
                      case 3:
                        if(_num < 1) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('Invalid number'),
                                content: Text('Number must be positive.'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () => Navigator.of(context).pop(0),
                                  ),
                                ],
                              );
                            });
                        } else {
                          _result = PrimeFactorization(_num);
                        }
                        break;
                      case 4:
                        if(_num > 20) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('Number too large'),
                                content: Text('Number must be 20 or less.'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () => Navigator.of(context).pop(0),
                                  ),
                                ],
                              );
                            });
                        } else {
                          _result = GetFactorial(_num);
                        }
                        break;
                      case 5:
                        if(_num < 1) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('Invalid number'),
                                  content: Text('Number must be positive.'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () => Navigator.of(context).pop(0),
                                    ),
                                  ],
                                );
                              });
                        } else {
                          _result = getHarmonicNumber(_num);
                        }
                        break;
                      default:
                        // do nothing
                    }
                  });
                },
                child: Text('Go!'),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.black,
              ),
              Text(
                '$_result',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        );
        break;
      case "2 Numbers":
        return SingleChildScrollView(
          padding: EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: new InputDecoration(labelText: "Number 1"),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        setState(() {
                          _text = value;
                          _num = int.parse(_text);
                        });
                      },
                    ),
                    TextField(
                      decoration: new InputDecoration(labelText: "Number 2"),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        setState(() {
                          _text2 = value;
                          _num2 = int.parse(_text2);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RadioListTile(
                      title: Text('Get their greatest common divisor'),
                      value: 11,
                      groupValue: _gValue1,
                      onChanged: (value) => _onRadioSelected1(value),
                    ),
                    RadioListTile(
                      title: Text('Get their least common multiple'),
                      value: 12,
                      groupValue: _gValue1,
                      onChanged: (value) => _onRadioSelected1(value),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    switch(_gValue1) {
                      case 11:
                        if(_num < 1 || _num2 < 1) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) {
                                return AlertDialog(
                                  title: Text('Invalid number'),
                                  content: Text('Number must be positive.'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () => Navigator.of(context).pop(0),
                                    ),
                                  ],
                                );
                              });
                        } else {
                          _result = GetGCD(_num, _num2, 0);
                        }
                        break;
                      case 12:
                        if(_num < 1 || _num2 < 1) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('Invalid number'),
                                content: Text('Number must be positive.'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () => Navigator.of(context).pop(0),
                                  ),
                                ],
                              );
                            });
                        } else {
                          _result = GetLCM(_num, _num2, 0);
                        }
                        break;
                      default:
                      // do nothing
                    }
                  });
                },
                child: Text('Go!'),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.black,
              ),
              Text(
                '$_result',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        );
        break;
      default:
        return SingleChildScrollView(
          padding: EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: new InputDecoration(labelText: "Number 1"),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        setState(() {
                          _text = value;
                          _num = int.parse(_text);
                        });
                      },
                    ),
                    TextField(
                      decoration: new InputDecoration(labelText: "Number 2"),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        setState(() {
                          _text2 = value;
                          _num2 = int.parse(_text2);
                        });
                      },
                    ),
                    TextField(
                      decoration: new InputDecoration(labelText: "Number 3"),
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        setState(() {
                          _text3 = value;
                          _num3 = int.parse(_text3);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    RadioListTile(
                      title: Text('Get their greatest common divisor'),
                      value: 21,
                      groupValue: _gValue2,
                      onChanged: (value) => _onRadioSelected2(value),
                    ),
                    RadioListTile(
                      title: Text('Get their least common multiple'),
                      value: 22,
                      groupValue: _gValue2,
                      onChanged: (value) => _onRadioSelected2(value),
                    ),
                  ]
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    switch(_gValue2) {
                      case 21:
                        if(_num < 1 || _num2 < 1 || _num3 < 1) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('Invalid number'),
                                content: Text('Number must be positive.'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () => Navigator.of(context).pop(0),
                                  ),
                                ],
                              );
                            });
                        } else {
                          _result = GetGCD(_num, _num2, _num3);
                        }
                        break;
                      case 22:
                        if(_num < 1 || _num2 < 1 || _num3 < 1) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return AlertDialog(
                                title: Text('Invalid number'),
                                content: Text('Number must be positive.'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () => Navigator.of(context).pop(0),
                                  ),
                                ],
                              );
                            });
                        } else {
                          _result = GetLCM(_num, _num2, _num3);
                        }
                        break;
                      default:
                      // do nothing
                    }
                  });
                },
                child: Text('Go!'),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.black,
              ),
              Text(
                '$_result',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        );
    }
  }

}

String PrimeOrNot(int n) {
  int i;
  String str = "";
  bool isPrime = true;
  if(n == 0) {
    str = "Invalid number.";
    return(str);
  }
  if(n == 1) {
    isPrime = false;
  } else {
    for (i = 2; i < n; i++) {
      if (n % i == 0) {
        isPrime = false;
      }
    }
  }
  if(isPrime == false) {
    str = "$n is not prime.";
  } else {
    str = "$n is prime.";
  }
  return(str);
}

String GetDivisors(int n) {
  int i;
  String str = "";
  if(n == 0) {
    str = "Invalid number.";
    return(str);
  }
  str = "Divisors for $n:\n";
  for(i = 1; i <= n; i++) {
    if(n % i == 0) {
      str += "$i  ";
    }
  }
  return(str);
}

String PrimeFactorization(int n) {
  String str = '';
  int q = n;
  int i = 2;
  bool firstPrimeFactor = true;
  if(n == 0) {
    str = "Invalid number.";
    return(str);
  }
  if(n == 1) {
    str = "1 = 1";
  } else {
    str = "$n = ";
    while (i <= q) {
      if (q % i == 0) {
        q ~/= i;
        if (firstPrimeFactor) {
          str += "$i";
          firstPrimeFactor = false;
        } else {
          str += " x $i";
        }
      } else {
        i += 1;
      }
    }
  }
  return(str);
}

String GetFactorial(int n) {
  String str = '';
  int i;
  int val = 1;
  if(n > 20) {
    str = "Number too large.\n(Number must be 20 or less)";
    return(str);
  }
  for(i = 1; i <= n; i++) {
    val *= i;
  }
  str = "$n! = $val";
  return(str);
}

String getHarmonicNumber(int n) {
  String str = '';
  int i;
  double val = 0.0;

  for(i = 1; i <= n; i++) {
    val += 1/i;
  }
  str = "1 + 1/2 + . . . + 1/$n = $val";
  return(str);
}

String GetGCD(int a, int b, int c) {
  String str = '';
  int n;
  int i;
  int gcd = 0;
  if(a == 0 || b == 0) {
    str = "Invalid number.";
    return(str);
  }
  if(c == 0) {
    str = "GCD($a, $b) = ";
    n = (a <= b) ? a : b;
    for (i = 1; i <= n; i++){
      if(a % i == 0 && b % i == 0) {
        gcd = i;
      }
    }
  } else {
    str = "GCD($a, $b, $c) = ";
    n = a;
    if (n > b) {
      n = b;
    }
    if (n > c) {
      n = c;
    }
    for (i = 1; i <= n; i++){
      if(a % i == 0 && b % i == 0 && c % i == 0) {
        gcd = i;
      }
    }
  }
  str += "$gcd";
  return (str);
}

String GetLCM(int a, int b, int c) {
  String str = '';
  int n;
  int i;
  int lcm = 0;
  int maxLCM;
  if(a == 0 || b == 0) {
    str = "Invalid number.";
    return(str);
  }
  if(c == 0) {
    str = "LCM($a, $b) = ";
    n = (a > b) ? a : b;
    maxLCM = a * b;
    for(i = maxLCM; i >= n; i--) {
      if(i % a == 0 && i % b == 0) {
        lcm = i;
      }
    }
  } else {
    str = "LCM($a, $b, $c) = ";
    n = a;
    if (n < b) {
      n = b;
    }
    if (n < c) {
      n = c;
    }
    maxLCM = a * b * c;
    for(i = maxLCM; i >= n; i--) {
      if(i % a == 0 && i % b == 0 && i % c == 0) {
        lcm = i;
      }
    }
  }
  str += "$lcm";
  return (str);
}