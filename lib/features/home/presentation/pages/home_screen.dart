import 'package:e/core/constant/text.dart';
import 'package:e/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/commom/widget/size_box.dart';
import '../widgets/catergory_gridview.dart';
import '../widgets/container_title.dart';
import '../widgets/slider_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w ,vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(shop,style: AppTextStyles.elMessIri40,),
              CustomSizedBox(height: 10),
              SliderImage(),
              CustomSizedBox(),
              ContainerTitle(
                onTap: (){},
                title: categories,
              ),
              CustomSizedBox(),
              SizedBox(
                height: 350.h,
                child: CategoryGridView(),
              ),
              CustomSizedBox(),
              ContainerTitle(
                onTap: (){},
                title: categories,
              ),
              CustomSizedBox(),
              SizedBox(
                height: 350.h,
                child: CategoryGridView(),
              ),
              Container(
                width: 191,
                height: 237,
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
                          width: 191,
                          height: 237,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: const Color(0x4C004182),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
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
                                left: 86,
                                top: 189,
                                child: Image.network(
                                  'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F38dcc162-b523-4d26-99bf-0ebce60f92b0.png',
                                  width: 49,
                                  height: 1,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Positioned(
                                left: 153,
                                top: 199,
                                child: Image.network(
                                  'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F20463e14-ee5b-4548-b954-4a0df1b3c481.png',
                                  width: 30,
                                  height: 30,
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
                                  'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2F150c0d1b-c9e0-47e9-8d83-463c81692dec.png',
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
                              ),
                              Positioned(
                                left: 0,
                                top: 6,
                                child: Container(
                                  width: 191,
                                  height: 128,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2F0SHRATvapcgGntutgDXs%2F6e0004c5a53234ca66d41f2e22babae3c4240b67Frame%2068.png?alt=media&token=3e1eec3c-755c-4ec6-92dc-7c2f609a71a5',
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
                                            borderRadius: BorderRadius.circular(15),
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
                                          'https://storage.googleapis.com/codeless-app.appspot.com/uploads%2Fimages%2F0SHRATvapcgGntutgDXs%2Fbdb300a8-9741-4055-8771-4a992bf50807.png',
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.contain,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
