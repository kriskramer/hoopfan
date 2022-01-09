import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hoop/providers/user_prov.dart';
import 'package:hoop/utils/fieldtype.dart';
import 'package:hoop/utils/validator_text.dart';
import 'package:provider/provider.dart';

class InputField extends StatefulWidget {
  final String name;
  final TextInputType keyboard;
  final bool validateField;
  final FieldType fieldType;
  final int maxlen;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final int maxLine;
  const InputField({
    Key key,
    @required this.name,
    @required this.keyboard,
    @required this.fieldType,
    this.maxlen,
    this.validateField = true,
    this.leftPadding = 20.0,
    this.rightPadding = 20.0,
    this.bottomPadding = 20.0,
    this.topPadding = 5.0,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController _controller;
  bool _hidePassword;
  @override
  void initState() {
    _controller = TextEditingController();
    _hidePassword = true;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _hidePassword = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.leftPadding,
        right: widget.rightPadding,
        top: widget.topPadding,
        bottom: widget.bottomPadding,
      ),
      child: TextFormField(
        style: const TextStyle(fontSize: 15),
        controller: _controller,
        validator: MultiValidator(errorMessages(widget.fieldType, widget.name)),
        onChanged: (value) {
          if (widget.fieldType == FieldType.email) {
            Provider.of<UserProv>(context, listen: false).setEmail(value);
          } else if (widget.fieldType == FieldType.displayName) {
            Provider.of<UserProv>(context, listen: false).setDisplayName(value);
          } else if (widget.fieldType == FieldType.password) {
            Provider.of<UserProv>(context, listen: false).setPassword(value);
          }
        },
        autocorrect: false,
        obscureText:
            widget.fieldType == FieldType.password ? _hidePassword : false,
        maxLength: widget.maxlen,
        maxLines: widget.maxLine,
        cursorColor: Colors.blue,
        keyboardType: widget.keyboard,
        inputFormatters: (TextInputType.number == widget.keyboard)
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        decoration: InputDecoration(
          prefixIcon: widget.fieldType == FieldType.email
              ? Icon(FluentIcons.mail_24_regular)
              : widget.fieldType == FieldType.password
                  ? Icon(FluentIcons.lock_closed_24_regular)
                  : widget.fieldType == FieldType.displayName
                      ? Icon(FluentIcons.person_24_regular)
                      : null,
          hintText: widget.name,
          hintStyle: TextStyle(fontSize: 20),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              widget.fieldType == FieldType.password
                  ? _hidePassword
                      ? FluentIcons.eye_hide_24_regular
                      : FluentIcons.eye_show_24_regular
                  : null,
            ),
            onPressed: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
          ),
        ),
      ),
    );
  }
}
