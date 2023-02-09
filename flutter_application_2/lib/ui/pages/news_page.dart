import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/character_bloc.dart';
import 'package:flutter_application_2/data/repositories/character_repo.dart';
import 'package:flutter_application_2/ui/pages/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 class NewsRicKandMorty extends StatefulWidget {
NewsRicKandMorty({super.key ,required this.title});
final String title;

  @override
  State<NewsRicKandMorty> createState() => _NewsRicKandMortyState();
}

class _NewsRicKandMortyState extends State<NewsRicKandMorty> {
final repository = CharacterRepo();
int gala = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(padding: EdgeInsets.all(8),decoration: const BoxDecoration(color: Colors.blue, shape:BoxShape.circle),
        child: IconButton(onPressed: (){
          if(gala == 1){
            gala = 2;
          }
          else{
            gala = 1;
          }
          setState(() {
            
          });
        }, icon: const Icon(Icons.accessible_rounded)),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(widget.title,style: Theme.of(context).textTheme.headline1,),
      ),
      body: BlocProvider(
        create: (context) => CharacterBloc(characterRepo: repository),
        child:  SearchPage(gala: gala,),
      ),
    );
  }
}

