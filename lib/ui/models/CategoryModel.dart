
import 'package:awok_starter/ui/models/BaseModel.dart';
import 'package:flutter/material.dart';

class CategoryModel extends BaseModel{
  String id; 
  String name; 
  Color color;
  String imageUrl; 

  CategoryModel(this.id,this.name,this.color,this.imageUrl);

  CategoryModel.createCategory(){
    this.id = "1";
    this.name = "Cat hello"; 
    this.color = Colors.blue;
    this.imageUrl= "";
  }
}