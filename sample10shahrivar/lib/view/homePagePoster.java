class homePagePoster extends StatelessWidget {
  const homePagePoster({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width/1.17,
          height: size.height/4.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                  image:AssetImage("assets/images/poster_test.png"),
                  fit: BoxFit.cover
              )
          ),
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  colors: gradiantcolors.posterGradiantColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
        ),
        Positioned(
          bottom: 8 ,
          right: 0,
          left: 0,
          child: Column(
            children: [Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(" نویسنده : ${homePagePoster["title"]}",style: TextStyle(color: Color.fromARGB(168, 255, 255, 255),fontWeight: FontWeight.w300,fontSize: 16,fontFamily: "bnazanin")),
                Row(
                  children: [
                    Text("${homePagePoster["view"]}",style: TextStyle(color: Color.fromARGB(168, 255, 255, 255),fontWeight: FontWeight.w300,fontSize: 16,fontFamily: "bnazanin")),
                    SizedBox(width: 5,),
                    Icon(Icons.remove_red_eye_outlined,color: Color.fromARGB(152, 255, 255, 255),),
                  ],
                ),

              ],
            ),
              SizedBox(height: 10,),
              Text("${homePagePoster["title"]}", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700,fontFamily: "bnazanin"),)
            ],
          ),
        )

      ],
    );
  }
}