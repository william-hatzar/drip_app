import 'package:drip_app/models/ProductModel.dart';

List<ProductsModel> products = [
  ProductsModel(
      productName: "Air Jordan 1",
      colour: "Black/White/Metallic Gold",
      category: "Shoes",
      price: "£175",
      rating: "3",
      imageUrl:
          "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/aewirmmftxbipywxwdkj/air-jordan-1-mid-se-shoes-gg517N.png",
      description: jordan1Description,
      reviews: 140),
  ProductsModel(
      productName: "Air Jordan 5 Retro",
      colour: "Black/White/Metallic Gold",
      category: "Shoes",
      price: "£250",
      rating: "5",
      imageUrl:
          "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/d79c4c47-f347-4050-89c5-788eebc0fc97/air-jordan-5-retro-shoes-T78RMv.png",
      description: jordan5Description,
      reviews: 80),
  ProductsModel(
      productName: "Air Jordan 1 Zoom",
      colour: "Black/White/Metallic Gold",
      category: "Shoes",
      price: "£115",
      rating: "5",
      imageUrl:
          "https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cd5b4bbf-263d-4f4c-8713-c94593137966/air-jordan-1-zoom-cmft-2-shoes-0Vxszn.png",
      description: jordan1CmftDescription,
      reviews: 90),
  ProductsModel(
      productName: "KAWS x UNIQLO UT",
      colour: "Black",
      category: "Sweatshirts",
      price: "£175",
      rating: "2",
      imageUrl:
          "https://www.kickgame.co.uk/cdn/shop/products/crewn-neck-kaws-black_grande.png?v=1694206687",
      description: kawsBlackJumper,
      reviews: 300),
  ProductsModel(
      productName: "Broken Planet",
      colour: "Black",
      category: "Sweatshirts",
      price: "£179",
      rating: "5",
      imageUrl:
          "https://www.kickgame.co.uk/cdn/shop/files/BPM-ITA-HOOD-NVY_grande.png?v=1707924654",
      description: brokenPlanetDesc,
      reviews: 125),
  ProductsModel(
      productName: "Nike x Nocta",
      colour: "Black",
      category: "Sweatshirts",
      price: "£250",
      rating: "5",
      imageUrl:
          "https://www.kickgame.co.uk/cdn/shop/products/Nike-x-Nocta-Tech-Fleece-Zip-Hoodie-_Black.png?v=1690892709",
      description: noctaDesc,
      reviews: 145),
  ProductsModel(
      productName: "Supreme Corteiz",
      colour: "Black",
      category: "T Shirts",
      price: "£80",
      rating: "5",
      imageUrl:
          "https://www.kickgame.co.uk/cdn/shop/files/SUP-CRTZ-RTW-TEE.png?v=1703675228",
      description: supremeDesc,
      reviews: 165),
];

String jordan1Description = "Play like '85.The Air Jordan 1 Mid SE brings fresh details and premium comfort to an iconic shoe.Its encapsulated Air-Sole unit cushions your foot, while the padded collar gives you a supportive feel on the move.";
String jordan5Description = "Care for a swim? The finishing touch to all your favourite 'fits returns with the AJ5 Aqua. Paying homage to the coveted AJ8 colourway from '93, energetic pops of Aqua and Taxi pulse against a black backdrop. Flawless details from the original like the spiky midsole, side vents and lace lock tie it all together, giving these cool kicks that look you love. Dive on in—the water's fine.";
String jordan1CmftDescription = "Premium suede and Jordan Brand's signature Formula 23 foam come together to give you an extra luxurious (and extra cosy) AJ1. You don't need to play either or when it comes to choosing style or comfort with this one—which is nice, 'cause you deserve both.";
String kawsBlackJumper = "This KAWS x UNIQLO UT Graphic Sweatshirt 'Black' features a depiction of KAWS' cherished COMPANION character, depicting a father and son. On the back, you'll discover the iconic XX design that is synonymous with KAWS' artwork.";
String brokenPlanetDesc = "The Broken Planet Market 'Into the Abyss' Hoodie in Navy is a must-have addition to your wardrobe, offering both style and comfort. Crafted with premium materials and attention to detail, this hoodie is perfect for those who appreciate quality streetwear.";
String noctaDesc = "SPECIAL COLLECTION CELEBRATING 10 YEARS OF TECH FLEECE.DOUBLE LAYERED HOOD, RIBBED HEM FINISHES, ARTICULATED SLEEVES. SIGNATURE NOCTA BRANDING, CUSTOM MOLDED 2-WAY METAL ZIPPER + PULLER.  53% COTTON. 47% POLYESTER.".toLowerCase();
String supremeDesc = "The Supreme Corteiz Rules The World Tee Black is a stylish and comfortable t-shirt that is perfect for any casual occasion. This t-shirt is part of the Supreme/Corteiz collaboration and features a printed graphic on the front and back. The graphic on the front reads \"\ Supreme Rules The World, which is a playful nod to Corteiz’s usual tagline Corteiz Rules The World\"\ ";
