import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../logic/search_provider.dart';

//AppBar with search bar
class MyAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.provider});

  final FutureProvider provider;
  @override
  ConsumerState<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class _MyAppBarState extends ConsumerState<MyAppBar> {
  bool cancelBtn = false;
  final _searchController = TextEditingController();

  void callProviders() async {
    ref
        .read(searchQueryProvider.notifier)
        .update((state) => _searchController.text);
    final data = await ref.read(widget.provider.future);
    ref
        .read(searchControllerProvider.notifier)
        .onSearchUser(_searchController.text, data);
  }

  void clearInputAndDisableKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        height: 50,
        child: SearchBar(
          controller: _searchController,
          onSubmitted: (_) {
            callProviders();
          },
          onChanged: (_) {
            callProviders();
          },
          onTap: () {
            setState(() {
              cancelBtn = true;
            });
          },
          leading: const Icon(Icons.search),
          trailing: [
            _searchController.text.isEmpty
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      clearInputAndDisableKeyboard();
                    },
                    icon: const Icon(Icons.cancel),
                  )
          ],
          hintText: 'Search',
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
        ),
      ),
      actions: [
        cancelBtn
            ? TextButton(
                onPressed: () {
                  clearInputAndDisableKeyboard();
                  ref.read(searchControllerProvider.notifier).state = [];
                  setState(() {
                    cancelBtn = false;
                  });
                },
                child: const Text("Cancel"),
              )
            : const SizedBox()
      ],
    );
  }
}
