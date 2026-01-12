import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 932,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 430,
                height: 932,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 16,
                      top: 91,
                      child: Container(
                        width: 348,
                        height: 50,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color(0xB2FFFFFF),
                          border: Border.all(
                            color: const Color(0xFF004182),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 24,
                              top: 13,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2Fc3b028c6-f67d-42f7-a6a1-777ca13ec0c3.png',
                                width: 24,
                                height: 24,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 55,
                              top: 15,
                              child: Text(
                                'what do you search for?',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0x9906004E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  height: 1.3,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //? image
                    Positioned(
                      left: 390,
                      top: 104,
                      child: Image.network(
                        'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F56706c84-1a50-43fc-8a91-2b53120e03df.png',
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 165,
                      child: Container(
                        width: 191,
                        height: 237,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0x4C004182),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 191,
                                height: 128,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2F0SHRATvapcgGntutgDXs%2F9b3f7ef60b089a0cbd184e6c358f2d6c87633283Frame%2068.png?alt=media&token=76ce3ee7-7494-41e8-ad05-b61daab9bc89',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: 153,
                                      top: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              spreadRadius: 0,
                                              offset: Offset(0, 5),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 158,
                                      top: 13,
                                      child: Image.network(
                                        'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F8953eef4-b281-4b5a-8f30-d2995d42d39e.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 135,
                              child: Text(
                                'Nike Air Jordon\nNike shoes flexible for wo..',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 179,
                              child: Text(
                                'EGP 1,200 ',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 179,
                              child: Text(
                                '2000 EGP',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0x99004182),
                                  fontSize: 11,
                                  height: 1.6,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 47,
                              top: 99,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2Fb3753b03-2a81-48dd-9016-f6b05f3b6f6b.png',
                                width: 97,
                                height: 39,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 52,
                              top: 205,
                              child: Text(
                                '(4.6)',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 206,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F70ac07cc-2471-4fda-8b72-214afbc5b642.png',
                                width: 15,
                                height: 15,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 205,
                              child: Text(
                                'Review',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 418,
                      child: Container(
                        width: 191,
                        height: 237,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0x4C004182),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 191,
                                height: 128,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2F0SHRATvapcgGntutgDXs%2F9c94fead44d8cca8cbefaee2fda823f48afba3bfFrame%2068.png?alt=media&token=2e09ca1b-0074-45e3-9a12-96a7abd6399a',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: 153,
                                      top: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              spreadRadius: 0,
                                              offset: Offset(0, 5),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 158,
                                      top: 13,
                                      child: Image.network(
                                        'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F22da0db8-f4c8-4550-ae8a-c8c429108ad1.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 135,
                              child: Text(
                                'Nike Air Jordon\nNike shoes flexible for wo..',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 179,
                              child: Text(
                                'EGP 1,000 ',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 179,
                              child: Text(
                                '1,300 EGP',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0x99004182),
                                  fontSize: 11,
                                  height: 1.6,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 47,
                              top: 99,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F908ccf1a-c56c-49bb-8d25-03af7a30812c.png',
                                width: 97,
                                height: 39,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 52,
                              top: 205,
                              child: Text(
                                '(4.8)',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 206,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2Fa96eccb2-1dc9-4bfe-9c18-54531ac08a6b.png',
                                width: 15,
                                height: 15,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 205,
                              child: Text(
                                'Review',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 671,
                      child: Container(
                        width: 191,
                        height: 237,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0x4C004182),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 191,
                                height: 128,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2F0SHRATvapcgGntutgDXs%2F8566d9a9a4cb63f336124bc440b84fe727065982Frame%2068.png?alt=media&token=490393cd-6a75-418a-ac9e-a59ca2e47b53',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: 153,
                                      top: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              spreadRadius: 0,
                                              offset: Offset(0, 5),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 158,
                                      top: 13,
                                      child: Image.network(
                                        'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F5abb3305-0103-4a08-bff9-7db9234d5bd4.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 135,
                              child: Text(
                                'Nike Air Jordon\nNike shoes flexible for wo..',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 179,
                              child: Text(
                                'EGP 1,800 ',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 179,
                              child: Text(
                                '2,100 EGP',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0x99004182),
                                  fontSize: 11,
                                  height: 1.6,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 47,
                              top: 99,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F1ccaa3c7-c9d8-40f2-8031-900fb8e6d2c1.png',
                                width: 97,
                                height: 39,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 52,
                              top: 205,
                              child: Text(
                                '(4.2)',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 206,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F33a4edb5-bb13-4478-9c52-c353a73e899f.png',
                                width: 15,
                                height: 15,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 205,
                              child: Text(
                                'Review',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 223,
                      top: 418,
                      child: Container(
                        width: 191,
                        height: 237,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0x4C004182),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 191,
                                height: 128,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2F0SHRATvapcgGntutgDXs%2F8c6eae63a9c0c7ea5979784c4b767d18c2167f3aFrame%2068.png?alt=media&token=4358f4e0-2807-430d-b8eb-4135332698e4',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: 153,
                                      top: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              spreadRadius: 0,
                                              offset: Offset(0, 5),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 158,
                                      top: 13,
                                      child: Image.network(
                                        'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2Ffdf147ec-eb55-4bd3-adee-133899057318.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 135,
                              child: Text(
                                'Nike Air Jordon\nNike shoes flexible for wo..',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 179,
                              child: Text(
                                'EGP 1,500 ',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 179,
                              child: Text(
                                '2000 EGP',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0x99004182),
                                  fontSize: 11,
                                  height: 1.6,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 47,
                              top: 99,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2Fc34b751d-fa2b-45d4-a19d-eae5761840d4.png',
                                width: 97,
                                height: 39,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 52,
                              top: 205,
                              child: Text(
                                '(4.8)',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 206,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F19db65f2-6d46-4e0a-acf1-a5c23c13c3aa.png',
                                width: 15,
                                height: 15,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 205,
                              child: Text(
                                'Review',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 223,
                      top: 671,
                      child: Container(
                        width: 191,
                        height: 237,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0x4C004182),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 191,
                                height: 128,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2F0SHRATvapcgGntutgDXs%2F88973023365d3f2e67e8de8c1f78c236dcc7201bFrame%2068.png?alt=media&token=3cd79384-ea03-4311-ab7f-a877ab90555a',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: 153,
                                      top: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              spreadRadius: 0,
                                              offset: Offset(0, 5),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 158,
                                      top: 13,
                                      child: Image.network(
                                        'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F25d3b40e-8ecb-449c-a80a-7a6c8b1890d8.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 135,
                              child: Text(
                                'Nike Air Jordon\nNike shoes flexible for wo..',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 179,
                              child: Text(
                                'EGP 1,900 ',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 179,
                              child: Text(
                                '2,500 EGP',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0x99004182),
                                  fontSize: 11,
                                  height: 1.6,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 47,
                              top: 99,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F99e750d5-cefe-414d-a408-505e844609c1.png',
                                width: 97,
                                height: 39,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 52,
                              top: 205,
                              child: Text(
                                '(3.8)',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 206,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F7cbab4b9-e980-460e-8c73-0c3051e2e433.png',
                                width: 15,
                                height: 15,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 205,
                              child: Text(
                                'Review',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 223,
                      top: 165,
                      child: Container(
                        width: 191,
                        height: 237,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0x4C004182),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 191,
                                height: 128,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2F0SHRATvapcgGntutgDXs%2F6e0004c5a53234ca66d41f2e22babae3c4240b67Frame%2068.png?alt=media&token=3c30a3ae-aad4-4426-a8d5-542838eb1f08',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15),
                                  ),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: 153,
                                      top: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              spreadRadius: 0,
                                              offset: Offset(0, 5),
                                              blurRadius: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 158,
                                      top: 13,
                                      child: Image.network(
                                        'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F90f6073d-abf9-44a2-a765-69aa0ba5a8da.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 135,
                              child: Text(
                                'Nike Air Jordon\nNike shoes flexible for wo..',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 179,
                              child: Text(
                                'EGP 1,100 ',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 179,
                              child: Text(
                                '1,500 EGP',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0x99004182),
                                  fontSize: 11,
                                  height: 1.6,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 47,
                              top: 99,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2Faf59e617-287a-402a-9834-0166fdb6a6d0.png',
                                width: 97,
                                height: 39,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 52,
                              top: 205,
                              child: Text(
                                '(4.5)',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 85,
                              top: 206,
                              child: Image.network(
                                'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2Ffe3db9ef-d304-4cb8-b4fd-b78172c150d7.png',
                                width: 15,
                                height: 15,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 205,
                              child: Text(
                                'Review',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: const Color(0xFF06004E),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
