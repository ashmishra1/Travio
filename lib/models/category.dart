class Category {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
        name: 'temple',
        imageUrl:
            'https://images.unsplash.com/photo-1617217139357-b77ae58ad4b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80'),
    const Category(
        name: 'park',
        imageUrl:
            'https://images.unsplash.com/photo-1503919005314-30d93d07d823?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
    const Category(
        name: 'monument',
        imageUrl:
            'https://images.unsplash.com/photo-1559927892-9bda6689491d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
    const Category(
        name: 'beach',
        imageUrl:
            'https://images.unsplash.com/photo-1621789097689-511e97f099e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
    const Category(
        name: 'museum',
        imageUrl:
            'https://images.unsplash.com/photo-1526285849717-482456cd7436?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
  ];
}
