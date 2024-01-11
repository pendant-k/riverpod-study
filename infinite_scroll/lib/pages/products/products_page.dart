import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll/models/product.dart';
import 'package:infinite_scroll/pages/product/product_page.dart';
import 'package:infinite_scroll/repositories/product_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  // pagingController for infinite scroll
  final PagingController<int, Product> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchProducts(pageKey);
    });
  }

  // get products from repository
  Future<void> _fetchProducts(int pageKey) async {
    try {
      // GET : new products
      final newProducts = await ref.read(productRepositoryProvider).getProducts(pageKey);

      // 새로 불러온 데이터의 총 길이가 limit보다 작으면 마지막 페이지로 간주할 수 있다
      final isLastPage = newProducts.length < limit;

      // page가 마지막인지에 따라 분기하여 페이지 추가를 처리한다.
      if (isLastPage) {
        _pagingController.appendLastPage(newProducts);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newProducts, nextPageKey);
      }
    } catch (e) {
      // 만약 에러가 발생한다면 해당 에러를 핸들링할 수 있도록 pagingController's error property에 할당한다.
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => _pagingController.refresh(),
        child: PagedListView<int, Product>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Product>(
            itemBuilder: (context, product, index) => GestureDetector(
              onTap: () {
                // Navigate to product page
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ProductPage(id: product.id),
                  ),
                );
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    child: Text(product.id.toString()),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(product.title),
                      subtitle: Text(product.description),
                    ),
                  ),
                ],
              ),
            ),
            noMoreItemsIndicatorBuilder: (context) => const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'No more items.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
