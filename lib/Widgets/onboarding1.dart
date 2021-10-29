class Onboarding1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Material(
        child: Stack(

          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Positioned(
              top: 15,
              left: 60,
              child: Container(
                width: 271.0,
                height: 290.0,
                child: Lottie.asset('assets/anim1.json'),
                  ),
                ),

            ClipPath(
              clipper: CClipperMaker(),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [const Color(0xf3d70652), const Color(0xFFD70652)],
                  ),
                ),
              ),
            ),
            Positioned(
               bottom: 240,
               child: Container(
                width: 213.0,
                height: 38.0,
                child: Text(
                  'Donate Plasma',
                  style: TextStyle(
                    fontFamily: 'Google Sans',
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ),
             ),
              Positioned(
                bottom: 120,
                child: Container(
                 width: 326.0,
                 height: 56.0,
                 child: Text(
                   'Give life! It doesn\'t take even 1 hour.',
                   style: TextStyle(
                     fontFamily: 'Google Sans',
                     fontSize: 18.0,
                     color: Colors.white,
                   ),
                   textAlign: TextAlign.center,
                 ),
             ),
              ),

          ],
        ),
      ),
    );
  }
}
