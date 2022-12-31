import 'package:flutter/material.dart';
import 'package:movie_tix/utils/text.dart';
import '../models/browse_model.dart';

class BrowseMovie extends StatelessWidget {
  const BrowseMovie({super.key, required List<BrowseModel> browseList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(text: 'Browse Movie',size: 26, color: Colors.black,),
          SizedBox(

          height: 90,
          child: ListView.builder(
            itemCount: browseList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              final item = browseList[index];
              return InkWell(
                onTap: (){},
                child: Column(
                  children: [
                    Container(
                      width: 56,
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(item.image),
                        fit: BoxFit.fill,
                        ),
                        ),
                    ),
                    modified_text(text: item.title, color: Colors.black, size: 13)
                  ],
                ),
              );
            },),
          )
        ],
      ),
    );

  }
}