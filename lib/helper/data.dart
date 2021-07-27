import 'package:flutter/cupertino.dart';
import 'package:news_app/models/category_model.dart';

List <CategoryModel> getCategories()
{
List<CategoryModel> category=new List<CategoryModel>();
CategoryModel categoryModel1=new CategoryModel();
categoryModel1.categoryName="Business";
categoryModel1.imageURL="https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
category.add(categoryModel1);

CategoryModel categoryModel2=new CategoryModel();
categoryModel2.categoryName="Health";
categoryModel2.imageURL="https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
category.add(categoryModel2);

CategoryModel categoryModel3=new CategoryModel();
categoryModel3.categoryName="Technology";
categoryModel3.imageURL="https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80";
category.add(categoryModel3);

CategoryModel categoryModel4=new CategoryModel();
categoryModel4.categoryName=" Sports";
categoryModel4.imageURL="https://img.theweek.in/content/dam/week/news/sports/images/2020/7/27/juventus-serie-a-title-ap.jpg";
category.add(categoryModel4);

CategoryModel categoryModel5=new CategoryModel();
categoryModel5.categoryName="Entertainment";
categoryModel5.imageURL="https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
category.add(categoryModel5);

return category;
}