import 'package:flutter/material.dart';
import 'package:netfixclone_app/viewmodels/homeviewmodel.dart';
import 'package:provider/provider.dart';

import '../core/constants/apiconstant.dart';


class NewHotScreen extends StatefulWidget {
  const NewHotScreen({super.key});

  @override
  State<NewHotScreen> createState() => _NewHotScreenState();
}

class _NewHotScreenState extends State<NewHotScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<Homeviewmodel>().getTrendingMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'New & Hot',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Consumer<Homeviewmodel>(
        builder: (context, viewModel, child) {
          if (viewModel.popularMovies.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: viewModel.trendingMovies.length,
            itemBuilder: (context, index) {
              final movie =
                  viewModel.trendingMovies[index];

              return Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    // Poster
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8),
                      child: Image.network(
                        '${ApiConstant.imageBaseUrl}${movie.posterPath}',
                        width: 120,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 15),

                    // Movie information
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            maxLines: 2,
                            overflow:
                                TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),

                              const SizedBox(width: 5),

                              Text(
                                movie.rating
                                    .toStringAsFixed(1),
                                style:
                                    const TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Text(
                            movie.overview,
                            maxLines: 5,
                            overflow:
                                TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}