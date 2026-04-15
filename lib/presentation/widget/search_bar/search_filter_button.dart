import 'package:flutter/material.dart';

class SearchFilterButton
    extends StatelessWidget {
  const SearchFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius:
      BorderRadius.circular(
          14),
      onTap: () {},
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color:
          Theme.of(context)
              .cardColor,
          borderRadius:
          BorderRadius.circular(
              14),
          border: Border.all(
            color:
            Theme.of(context)
                .dividerColor,
          ),
        ),
        child: Icon(
          Icons.tune,
          color:
          Theme.of(context)
              .iconTheme
              .color,
        ),
      ),
    );
  }
}