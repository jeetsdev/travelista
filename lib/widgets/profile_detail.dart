import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final String labelText;
  final String labelValue;
  const ProfileDetail(this.labelText, this.labelValue);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              labelValue,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
