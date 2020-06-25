import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './base_view.dart';
import '../../core/viewmodels/home_model.dart';
import '../../core/enum/viewstate.dart';
import '../widgets/publication_widgets/single_post.dart';
import 'package:MyApp/ui/shared/SideMenuWidget.dart';
import 'package:MyApp/ui/shared/floatingButton.dart';
import 'package:MyApp/ui/shared/searchBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getAllPublications(),
      builder: (context, model, child) => Scaffold(
        drawer: SideMenuWidget(model: model),
        floatingActionButton: FloatingButton(),
        backgroundColor: Color(0xFFF5F5F8),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(
                color: Colors.black45,
              ),
              backgroundColor: Color(0xFFF5F5F8),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.solidBell),
                  SearchBar(),
                ],
              ),
              pinned: true,
              floating: false,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text('Acceuil',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Times",
                          color: Colors.black))),
            ),
            model.state == ViewState.Busy
                ? SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        print("the index is $index");
                        return SinglePublicationWidget(
                            publication: model.publications[index],
                            poster: model.publications[index]?.postedBy);
                      },
                      childCount: model.publications?.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
