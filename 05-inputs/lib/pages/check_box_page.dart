import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({Key? key}) : super(key: key);

  @override
  State<CheckBoxPage> createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(''''
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy
text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
        '''),
              CheckboxListTile(
                value: _checked,
                contentPadding: EdgeInsets.zero,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                    'sadkfjnaskdj nalksdnlkasn lksndflksdf lkn asd ma sdñalk msdñkam'),
                onChanged: (v) {
                  _checked = v ?? false;
                  setState(() {});
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() => _checked = !_checked);
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: _checked,
                      onChanged: (v) {
                        _checked = v ?? false;
                        setState(() {});
                      },
                    ),
                    const Expanded(
                      child: Text(
                          'sadkfjnaskdj nalksdnlkasn lksndflksdf lkn asd ma sdñalk msdñkam'),
                    )
                  ],
                ),
              ),
              Checkbox(
                value: _checked,
                fillColor: MaterialStateProperty.all(Colors.blue),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onChanged: (v) {
                  _checked = v ?? false;
                  setState(() {});
                },
              ),
              SwitchListTile(
                value: _checked,
                contentPadding: EdgeInsets.zero,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                inactiveTrackColor: Colors.amber.shade100,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                    'sadkfjnaskdj nalksdnlkasn lksndflksdf lkn asd ma sdñalk msdñkam'),
                onChanged: (v) {
                  _checked = v;
                  setState(() {});
                },
              ),
              ElevatedButton(
                onPressed: _checked ? () {} : null,
                child: const Text('Nest'),
              )
            ],
          ),
        ),
      )),
    );
  }
}
