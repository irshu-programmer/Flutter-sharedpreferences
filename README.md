# Flutter-sharedpreferences

1) To save shared preference first you need to add library in pubspect.yamal
                 shared_preferences:

2) next you need to save this code


                                 class _MyHomePageState extends State<MyHomePage> {
                                   var _controller = new TextEditingController();

                                   Future<SharedPreferences> _sPrefs = SharedPreferences.getInstance();
                                 Future<Null> addString() async {
                                   final SharedPreferences prefs = await _sPrefs;
                                 prefs.setString("name", _controller.text);

                                 setState(() {
                                   _controller.text = '';

                                 });  
                                 }
3) call this function 
                                 onPressed: () {
                                              addString();
                                              Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => SecondPage()
             
                                              ),);
                                             },

4) in second page 


                                            class _MySecondPageHomeState extends State<MySecondPageHome> {
                                            String name ;
                                            Future<SharedPreferences> _sPrefs = SharedPreferences.getInstance();
                                              Future<Null> getString() async {
                                                 final SharedPreferences prefs = await _sPrefs;
                                              setState(() {
    
                                              name = prefs.getString("name");
                                              });
                                            }
                                            @override
                                              void initState() {
                                                getString();
                                                super.initState();
                                              }
                                               updateName(){
                                            setState(() {
                                              this.name = name;
                                            });

5) finally displaying data in textbox

                                           child: Text("You enterd $name"),
