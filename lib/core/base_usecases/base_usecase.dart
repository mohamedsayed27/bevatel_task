import 'package:equatable/equatable.dart';


abstract class  BaseUsecase<T,Parameters>{
  Future<T>call(Parameters parameters);
}
class NoParameters extends Equatable{
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
