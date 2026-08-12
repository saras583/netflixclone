import 'package:flutter/material.dart';
import 'package:netfixclone_app/viewmodels/homeviewmodel.dart';
import 'package:netfixclone_app/widgets/moveisction.dart';
import 'package:provider/provider.dart';

import '../core/constants/apiconstant.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<Homeviewmodel>().getPopulorMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Consumer<Homeviewmodel>(
        builder: (context, viewModel, child) {
          // Loading
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }

          // No movies
          if (viewModel.popularMovies.isEmpty) {
            return const Center(
              child: Text(
                'No movies found',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            );
          }

          // First movie for Hero Banner
          final movie = viewModel.popularMovies.first;

          return SingleChildScrollView(
            child: Column(
              children: [
                

                SizedBox(
                  height: 500,
                  child: Stack(
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Image.network(
                          '${ApiConstant.imageBaseUrl}${movie.backdropPath}',
                          fit: BoxFit.cover,

                          errorBuilder: (
                            context,
                            error,
                            stackTrace,
                          ) {
                            return Container(
                              color: Colors.grey.shade900,
                            );
                          },
                        ),
                      ),

                      // Dark gradient
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.2),
                                Colors.black,
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Movie information
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 30,
                        child: Column(
                          children: [
                            // Movie title
                            Text(
                              movie.title,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // Movie overview
                            Text(
                              movie.overview,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),

                            const SizedBox(height: 15),

                            // Buttons
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                // My List
                                OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'My List',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 15),

                                // Play
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                  label: const Text(
                                    'Play',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                MovieSection(
                  title: 'Popular Movies',
                  movies: viewModel.popularMovies,
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}