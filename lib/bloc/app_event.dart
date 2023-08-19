import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
@immutable
abstract class ProductEvent extends Equatable{

}
class LoadProductEvent extends ProductEvent{
@override
  List<Object?> get props => [];

}