import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title",style: Theme.of(context).textTheme.titleSmall,),

            const Text("Description of Task",),
            const Text("Date : 12/5/2025"),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Chip(label: Text("New",style: TextStyle(fontSize: 12,
                    fontWeight: FontWeight.bold
                ),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  side: BorderSide(color: AppColors.themeColor),),
                Wrap(
                  children: [
                    IconButton(onPressed: (){}, icon:Icon(Icons.edit)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                  ],
                )

              ],
            )

          ],
        ),
      ),
    );
  }
}