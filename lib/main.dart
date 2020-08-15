import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('http://menus.tufts.edu');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>> breakfastItems;
  List<Map<String, dynamic>> lunchItems;
  List<Map<String, dynamic>> dinnerItems;

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper
        .loadWebPage('/FoodPro%203.1.NET/shortmenu.aspx?sName=TUFTS+DINING&locationNum=09&locationName=Carmichael+Dining+Center&naFlag=1#')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        breakfastItems = webScraper.getElement(
            '', ['href', 'title']);
        print(breakfastItems);
        lunchItems = webScraper.getElement(
            'div.thumbnail > div.caption > h4 > a.title', ['href', 'title']);
        dinnerItems = webScraper.getElement(
            'div.thumbnail > div.caption > h4 > a.title', ['href', 'title']);
        
            //store menu items in firebase
            Firestore.instance.collection('MenuItems').document()
            .setData({ 'Breakfast': breakfastItems, 'Lunch': lunchItems, 
                       'Dinner': dinnerItems });
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(child: Text('Breakfast')),
                Tab(child: Text('Lunch')),
                Tab(child: Text('Dinner')),
              ],
            ),
            title: Text('Carmichael Hall'),
          ),
          body: TabBarView(
            children: [
              BreakfastPage(),
              LunchPage(),
              DinnerPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class

class BreakfastPageState extends StatelessWidget {
  const GalleryApp({
    Key key,
    this.initialRoute,
    this.isTestMode = false,
  }) : super(key: key);

  final bool isTestMode;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: GalleryOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: null,
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: isTestMode,
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Gallery',
            debugShowCheckedModeBanner: false,
            themeMode: GalleryOptions.of(context).themeMode,
            theme: GalleryThemeData.lightThemeData.copyWith(
              platform: GalleryOptions.of(context).platform,
            ),
            darkTheme: GalleryThemeData.darkThemeData.copyWith(
              platform: GalleryOptions.of(context).platform,
            ),
            localizationsDelegates: const [
              ...GalleryLocalizations.localizationsDelegates,
              LocaleNamesLocalizationsDelegate()
            ],
            initialRoute: initialRoute,
            supportedLocales: GalleryLocalizations.supportedLocales,
            locale: GalleryOptions.of(context).locale,
            localeResolutionCallback: (locale, supportedLocales) {
              deviceLocale = locale;
              return locale;
            },
            onGenerateRoute: RouteConfiguration.onGenerateRoute,
          );
        },
      ),
    );
  }
}

class LunchPageState extends StatelessWidget {
  const GalleryApp({
    Key key,
    this.initialRoute,
    this.isTestMode = false,
  }) : super(key: key);

  final bool isTestMode;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: GalleryOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: null,
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: isTestMode,
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Gallery',
            debugShowCheckedModeBanner: false,
            themeMode: GalleryOptions.of(context).themeMode,
            theme: GalleryThemeData.lightThemeData.copyWith(
              platform: GalleryOptions.of(context).platform,
            ),
            darkTheme: GalleryThemeData.darkThemeData.copyWith(
              platform: GalleryOptions.of(context).platform,
            ),
            localizationsDelegates: const [
              ...GalleryLocalizations.localizationsDelegates,
              LocaleNamesLocalizationsDelegate()
            ],
            initialRoute: initialRoute,
            supportedLocales: GalleryLocalizations.supportedLocales,
            locale: GalleryOptions.of(context).locale,
            localeResolutionCallback: (locale, supportedLocales) {
              deviceLocale = locale;
              return locale;
            },
            onGenerateRoute: RouteConfiguration.onGenerateRoute,
          );
        },
      ),
    );
  }
}

class DinnerPageState extends StatelessWidget {
  const GalleryApp({
    Key key,
    this.initialRoute,
    this.isTestMode = false,
  }) : super(key: key);

  final bool isTestMode;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: GalleryOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: null,
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: isTestMode,
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Gallery',
            debugShowCheckedModeBanner: false,
            themeMode: GalleryOptions.of(context).themeMode,
            theme: GalleryThemeData.lightThemeData.copyWith(
              platform: GalleryOptions.of(context).platform,
            ),
            darkTheme: GalleryThemeData.darkThemeData.copyWith(
              platform: GalleryOptions.of(context).platform,
            ),
            localizationsDelegates: const [
              ...GalleryLocalizations.localizationsDelegates,
              LocaleNamesLocalizationsDelegate()
            ],
            initialRoute: initialRoute,
            supportedLocales: GalleryLocalizations.supportedLocales,
            locale: GalleryOptions.of(context).locale,
            localeResolutionCallback: (locale, supportedLocales) {
              deviceLocale = locale;
              return locale;
            },
            onGenerateRoute: RouteConfiguration.onGenerateRoute,
          );
        },
      ),
    );
  }
}
