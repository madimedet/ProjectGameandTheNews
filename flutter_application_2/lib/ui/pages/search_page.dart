import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/character_bloc.dart';
import 'package:flutter_application_2/ui/widgets/custom_list_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../data/model/character.dart';

class SearchPage extends StatefulWidget {
  int gala;
  SearchPage({super.key, required this.gala});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Character _currentCharacter;
  List<Results> _currentResults = [];
  int _currentPage = 1; 
  String _currentSearchStr = '';
  @override
  void initState() {
    if(_currentResults.isEmpty){
      context
        .read<CharacterBloc>()
        .add(const CharacterEvent.fetch(name: '', page: 1));
    }
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBloc>().state;
    return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 15,right: 16,left: 16),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor:  Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search,color: Colors.black,),
                hintText: 'search me',
    
              ),
              onChanged: (value){
                _currentPage = 1;
                _currentResults = [];
                _currentSearchStr = value;
                context.read<CharacterBloc>().add(CharacterEvent.fetch(name: value, page: 1));
              },
            ),
          ),
          state.when(
              loading: () {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                      SizedBox(
                        width: 10,
                      ),  
                      Text("Loading.....")
                    ],
                  ),
                );
              },
              loaded: (characterLoaded){
                _currentCharacter = characterLoaded;
                _currentResults = _currentCharacter.results;
                return   Expanded(child: _custumlisView(_currentResults));
              },
              error: () => const Text("Please try again")),
        ],
      );
    
  }
  Widget _custumlisView(List<Results> currentResults){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: widget.gala,mainAxisSpacing: 10,crossAxisSpacing: 5
  ),
        controller: ScrollController(),
        shrinkWrap: true,
        itemCount: currentResults.length,
        itemBuilder: (BuildContext context, int index) {
          final result = currentResults[index];
          return CustumListTile(result: result);
        },
      ),
    );
  }
}
