import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/pages/products_details_page.dart';
import 'package:shop_app/widgets/single_product.dart';


class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final List<String> filters = const
  [
    "All",
    "Addidas",
    "Nike",
    "Bata",
  ];
  late String selectedFilter;

  @override
  void initState()
  {
    super.initState();
    selectedFilter = filters[0];
  }


  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    const border = OutlineInputBorder(
        borderRadius: BorderRadius.horizontal
          (
            left: Radius.circular(50)
        ),
        borderSide: BorderSide(
            color: Color.fromRGBO(225,225, 225, 1)
        )
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      isDense: true,
                      prefixIcon: const Icon(Icons.search),
                      enabledBorder:border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ]
          ),
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (BuildContext context, int index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedFilter = filter;

                      });
                    },
                    child: Chip(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      label: Text(filter,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                            color: Color.fromRGBO(245, 247, 249, 1),
                          )
                      ),
                      backgroundColor:(selectedFilter==filter) ? Theme.of(context).colorScheme.primary: Color.fromRGBO(245, 247, 249, 1),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context,BoxConstraints constraints)
                {
                  if(constraints.maxWidth > 1184)
                    {
                      return (GridView.builder(
                                        itemCount: products.length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.75),
                                        itemBuilder: (context ,index){
                                        final product = products[index];
                                        return GestureDetector(
                                        onTap: (){
                                        Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                        ProductsDetailsPage(
                                        product: products[index])),);
                                        },
                                        child: ProductCard(
                                        title: product["title"] as String,
                                        price: product["price"] as double,
                                        image: product['imageUrl'] as String,
                                        bgColor: index.isEven
                                        ? Color.fromRGBO(216, 240, 253, 1)
                        : Color.fromRGBO(245, 247, 249, 1),),
                                        );
                                        }));
                    }
                  else
                    {
                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index)
                        {
                          final product = products[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ProductsDetailsPage(
                                    product: products[index])),);
                            },
                            child: ProductCard(
                              title: product["title"] as String,
                              price: product["price"] as double,
                              image: product['imageUrl'] as String,
                              bgColor: index.isEven
                                  ? Color.fromRGBO(216, 240, 253, 1)
                                  : Color.fromRGBO(245, 247, 249, 1),),
                          );

                        },
                      );
                    }
                }),
          ),
        ],
      ),
    );
  }
}
