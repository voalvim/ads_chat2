import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EscreveTexto extends StatefulWidget {
  const EscreveTexto({super.key, required this.salvaMensagem});

  final Function({String text, XFile imgFile}) salvaMensagem;

  @override
  State<EscreveTexto> createState() => _EscreveTextoState();
}

class _EscreveTextoState extends State<EscreveTexto> {
  final TextEditingController capturaTexto = TextEditingController();
  bool ativaSend = false;

  final imagePicker = ImagePicker();

  void reset() {
    capturaTexto.clear();
    setState(() {
      ativaSend = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
              onPressed: () async {
                final imgFile =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (imgFile == null) return;
                widget.salvaMensagem(imgFile: imgFile);
              },
              icon: const Icon(Icons.photo_camera)),
          Expanded(
              child: TextField(
            controller: capturaTexto,
            decoration:
                const InputDecoration.collapsed(hintText: 'Enviar Mensagem'),
            onChanged: (texto) {
              setState(() {
                ativaSend = texto.isNotEmpty;
              });
            },
            onSubmitted: (texto) {
              widget.salvaMensagem(text: texto);
              reset();
            },
          )),
          IconButton(
              onPressed: ativaSend
                  ? () {
                      widget.salvaMensagem(text: capturaTexto.text);
                      reset();
                    }
                  : null,
              icon: const Icon(Icons.send)),
        ],
      ),
    );
  }
}
