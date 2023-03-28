import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          const Icon(
            Icons.sticky_note_2_rounded,
            size: 30,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: TextFormField(
            cursorColor: Colors.white,
            keyboardType: TextInputType.text,
            maxLength: 15,
            decoration: InputDecoration(
                hintText: 'Agregar comentario (Opcional)',
                hintStyle: const TextStyle(
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.white))),
          ))
        ],
      ),
    );
  }
}
