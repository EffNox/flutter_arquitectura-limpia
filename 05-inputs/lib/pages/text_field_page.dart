import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inputs/constants/countries.dart';
import 'package:inputs/models/country.dart';
import 'package:inputs/utils/capitalize_input_formatter.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final _textEditingController = TextEditingController();

  late final List<Country> _countries;

  @override
  void initState() {
    super.initState();
    _countries = countries.map((e) => Country.fromJson(e)).toList();
    _textEditingController.text = '';
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _textEditingController;
    late final List<Country> filteredList;
    filteredList = (query.text.isEmpty)
        ? _countries
        : _countries
            .where(
                (e) => e.name.toLowerCase().contains(query.text.toLowerCase()))
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _textEditingController,
          inputFormatters: [
            // FilteringTextInputFormatter(RegExp(r"([A-Z]|[a-z])"), allow: false),
            // FilteringTextInputFormatter.allow(RegExp(r"([A-Z]|[a-z])")),
            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
            CapitalizeInputFormatter(),
          ],
          enabled: true,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            // label: Text('Search...'),
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Colors.black26),
            prefixIcon: const Icon(Icons.search_outlined),
            suffixIcon: IconButton(
                onPressed: () {
                  _textEditingController.text = '';
                  //Si se usa esto no es necesario usar setState, ya que flutter renderiza nuevamente la vista
                  FocusScope.of(context).unfocus();
                },
                icon: const Icon(Icons.clear_outlined)),
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Color(0xff00bf45)),
            // ),
            focusedBorder: InputBorder.none,
            // enabledBorder: UnderlineInputBorder(
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final country = filteredList[index];
          return ListTile(
            leading: Text(country.dialCode),
            title: Text(country.name),
            trailing: Text(country.code),
          );
        },
      ),
    );
  }
}
