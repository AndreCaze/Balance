import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          const Icon(
            Icons.sticky_note_2_outlined,
            size: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextFormField(
              cursorColor: Colors.white,
              keyboardType: TextInputType.text,
              maxLength: 15,
              decoration: InputDecoration(
                counterText: '',
                hintText: ' Pon tu comentario (Opcional)',
                hintStyle: const TextStyle(
                  fontSize: 13,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
