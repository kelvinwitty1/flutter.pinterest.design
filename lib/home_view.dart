import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> imageList=[
    'https://images.unsplash.com/photo-1633114127408-af671c774b39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    'https://th.bing.com/th/id/R.c064d11c8ee84ad8a71c00e243bbf13e?rik=T1cURG1aB%2fKDEA&pid=ImgRaw&r=0',
    'https://images.unsplash.com/photo-1633113087654-c49c686c2cdf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    'https://images.unsplash.com/photo-1638741015176-8f280df193f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1638735037874-d6141ffd9d8a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
    'https://images.unsplash.com/photo-1638730035914-6977a1d56f67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    'https://images.unsplash.com/photo-1638627891024-5dfe8eb58528?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1543&q=80',
    'https://images.unsplash.com/photo-1638695214225-dcd28b4cb3a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(12),
          child: StaggeredGridView.countBuilder(
            mainAxisSpacing:8,
            crossAxisSpacing: 8,
            crossAxisCount: 2, 
          itemCount:imageList.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: (context)=>SizedBox(
                  height:MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width, child: Image.network(imageList[index],
                    fit:BoxFit.cover,
                  ),
                
                  )
                  );
              },
              child: Container(
               decoration: const BoxDecoration(
                 color: Colors.transparent,
                 borderRadius: BorderRadius.all(Radius.circular(12),),
               ),
               child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12)),
               child: FadeInImage.memoryNetwork(placeholder:kTransparentImage, image: imageList[index],
               fit: BoxFit.cover,
               ),
               ),
                      ),
            );
          },
           staggeredTileBuilder: (index)
           {
             return StaggeredTile.count(1, index.isOdd ?1.2:1.8);
           }
           ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}