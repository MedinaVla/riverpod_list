import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_list/src/logic/list_provider.dart';

class SearchView extends ConsumerWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final userList = watch(namesProvider).state;
    final search = watch(searchProvider);
    return Scaffold(
      appBar: _buildAppBar(search),
      body: _buildBody(userList),
    );
  }

  ListView _buildBody(List<String> userList) {
    return ListView.separated(
        itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(userList[index]),
              ),
            ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: userList.length);
  }

  AppBar _buildAppBar(StateController<String> search) {
    return AppBar(
      title: Row(
        children: [
          Text('Username: '),
          Container(
            width: 200,
            child: TextFormField(
              onChanged: (val) {
                search.state = val;
              },
              cursorColor: Colors.red,
            ),
          ),
          Icon(Icons.search)
        ],
      ),
      centerTitle: true,
    );
  }
}
