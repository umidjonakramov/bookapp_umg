import 'package:bookapp_umg/presentation/screens/dashboard/dashboard_bloc.dart';
import 'package:bookapp_umg/presentation/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/components/bookitem.dart';
import '../../../../utils/components/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var bloc = MainBloc();

  @override
  void initState() {
    bloc.add(LoadAllBooks());
    super.initState();
    logger.d(bloc.state.books.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider.value(
        value: bloc,
        child: BlocListener<MainBloc, MainState>(
          listener: (context, state) {
          },
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset("assets/images/arrowback.png",
                              color: Colors.black),
                        ),
                        Text(
                          'Explore',
                          style: TextStyle(
                            color: const Color(0xFFF26B6C),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child:
                              const Icon(Icons.more_vert, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Releases Book',
                          style: TextStyle(
                            color: const Color(0xFF4F4F4F),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            color: const Color(0xFFF26B6C),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          return bookItem(state.books[index].image, () {
                            Navigator.pushNamed(
                                context, 'play',
                                arguments: {"book": state.books[index]});
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                            color: const Color(0xFF4F4F4F),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            color: const Color(0xFFF26B6C),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        categoryItem("Thriller", const Color(0xFFF26B6C)),
                        categoryItem("Suspense", const Color(0xFF219653)),
                        categoryItem("Humour", const Color(0xFFF2C94C))
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Featured Books',
                          style: TextStyle(
                            color: const Color(0xFF4F4F4F),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            color: const Color(0xFFF26B6C),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                        child: GridView.builder(
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.books.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, childAspectRatio: 0.7),
                            itemBuilder: (context, index) {
                              return bookItem(state.books[index].image, () {
                                Navigator.pushNamed(
                                    context, 'play',
                                    arguments: {"book": state.books[index]});
                              });
                            }))
                  ],
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
