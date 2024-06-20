List<RestaurantModel> dummyRestaurants = [
  RestaurantModel(
    name: "The Fancy Fork",
    address: "123 Main Street, Springfield",
    image: "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38",
    rating: "4.5",
    price: "\$\$",
    distance: "0.5 km",
    description:
        "A gourmet dining experience with a modern twist on classic dishes.",
    phone: "(123) 456-7890",
  ),
  RestaurantModel(
    name: "Pasta Palace",
    address: "456 Elm Street, Springfield",
    image: "https://images.unsplash.com/photo-1586190848861-99aa4a171e90",
    rating: "4.7",
    price: "\$\$",
    distance: "1.2 km",
    description:
        "Authentic Italian cuisine with a cozy, family-friendly atmosphere.",
    phone: "(234) 567-8901",
  ),
  RestaurantModel(
    name: "Sushi Central",
    address: "789 Oak Street, Springfield",
    image: "https://images.unsplash.com/photo-1553621042-f6e147245754",
    rating: "4.8",
    price: "\$\$\$",
    distance: "0.8 km",
    description:
        "Fresh and delicious sushi made to order with the finest ingredients.",
    phone: "(345) 678-9012",
  ),
  RestaurantModel(
    name: "Burger Bonanza",
    address: "321 Pine Street, Springfield",
    image: "https://images.unsplash.com/photo-1550547660-d9450f859349",
    rating: "4.2",
    price: "\$",
    distance: "1.5 km",
    description:
        "Juicy and flavorful burgers served with a variety of unique toppings.",
    phone: "(456) 789-0123",
  ),
  RestaurantModel(
    name: "Taco Haven",
    address: "654 Maple Street, Springfield",
    image: "https://images.unsplash.com/photo-1571091655789-4cbf83d8f5df",
    rating: "4.6",
    price: "\$",
    distance: "2.0 km",
    description:
        "Tasty tacos with fresh ingredients and bold flavors, perfect for any meal.",
    phone: "(567) 890-1234",
  ),
  RestaurantModel(
    name: "Vegetarian Delight",
    address: "987 Cedar Street, Springfield",
    image: "https://images.unsplash.com/photo-1544510807-508b6b802f6e",
    rating: "4.9",
    price: "\$\$",
    distance: "0.6 km",
    description:
        "Delicious vegetarian and vegan options that are both healthy and satisfying.",
    phone: "(678) 901-2345",
  ),
  RestaurantModel(
    name: "Seafood Shack",
    address: "159 Birch Street, Springfield",
    image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
    rating: "4.3",
    price: "\$\$\$",
    distance: "1.8 km",
    description:
        "Fresh and flavorful seafood dishes served in a casual, beach-themed setting.",
    phone: "(789) 012-3456",
  ),
  RestaurantModel(
    name: "Curry Corner",
    address: "753 Walnut Street, Springfield",
    image: "https://images.unsplash.com/photo-1546069901-eacef0df6022",
    rating: "4.7",
    price: "\$\$",
    distance: "1.0 km",
    description:
        "Spicy and aromatic Indian cuisine with a wide variety of curry dishes.",
    phone: "(890) 123-4567",
  ),
  RestaurantModel(
    name: "Pizza Paradise",
    address: "852 Cherry Street, Springfield",
    image: "https://images.unsplash.com/photo-1601924572350-71741d5c71a3",
    rating: "4.4",
    price: "\$",
    distance: "1.3 km",
    description:
        "Classic and creative pizzas made with fresh ingredients and a perfect crust.",
    phone: "(901) 234-5678",
  ),
  RestaurantModel(
    name: "BBQ Barn",
    address: "951 Aspen Street, Springfield",
    image: "https://images.unsplash.com/photo-1604152135912-04a2375d0606",
    rating: "4.6",
    price: "\$\$",
    distance: "2.2 km",
    description:
        "Mouth-watering BBQ dishes with a smoky flavor and a variety of sauces.",
    phone: "(012) 345-6789",
  ),
];

class RestaurantModel {
  final String? name;
  final String? address;
  final String? image;
  final String? rating;
  final String? price;
  final String? distance;
  final String? description;
  final String? phone;

  RestaurantModel({
    this.name,
    this.address,
    this.image,
    this.rating,
    this.price,
    this.distance,
    this.description,
    this.phone,
  });
}
