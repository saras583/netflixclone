import 'package:flutter/material.dart';
import 'package:netfixclone_app/viewmodels/searchmodel.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchEditingController =
      TextEditingController();

  @override
  void dispose() {
    searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Column(
          children: [
            

            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

           

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: TextField(
                controller: searchEditingController,

                // When user presses Enter/Search
                onSubmitted: (query) {
                  context
                      .read<SearchViewModel>()
                      .searchMovies(query);
                },

                style: const TextStyle(
                  color: Colors.white,
                ),

                decoration: InputDecoration(
                  hintText: 'Search movies and shows',

                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),

                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),

                  filled: true,

                  fillColor: Colors.grey.shade900,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            

            Expanded(
              child: Consumer<SearchViewModel>(
                builder: (
                  context,
                  viewModel,
                  child,
                ) {
                 

                  if (viewModel.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  

                  if (viewModel.searchResults.isEmpty) {
                    return const Center(
                      child: Text(
                        'Search for a movie',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    );
                  }

                  // =========================
                  // RESULTS
                  // =========================

                  return GridView.builder(
                    padding: const EdgeInsets.all(16),

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.65,
                    ),

                    itemCount:
                        viewModel.searchResults.length,

                    itemBuilder: (
                      context,
                      index,
                    ) {
                      final movie =
                          viewModel.searchResults[index];

                      return Center(
                        child: Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}