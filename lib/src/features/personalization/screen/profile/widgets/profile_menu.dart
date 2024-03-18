import 'package:flutter/material.dart';

class danProfileMenu extends StatelessWidget {
  const danProfileMenu({
    super.key,
    required this.leading,
    required this.name,
    required this.onPressed,
    this.trailing = Icons.arrow_forward_ios_sharp,
  });

  final String leading;
  final String name;
  final IconData trailing;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(leading),
      title: Center(
        child: Text(
          name,
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
      trailing: Icon(trailing),
      onTap: onPressed,
    );
    // return Column(
    //   children: [
    //     GestureDetector(
    //       onTap: (){
    //         danHelperFunction.showSnackBar("message");
    //       },
    //       child: Container(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(leading, style: Theme.of(context).textTheme.bodyMedium,),
    //             Text(name, style: Theme.of(context).textTheme.bodyMedium,),
    //             Icon(trailing),
    //           ],
    //         ),
    //       ),
    //     ),
    //     SizedBox(height: danSizes.spacebtwItems,),
    //   ],
    // );
  }
}
