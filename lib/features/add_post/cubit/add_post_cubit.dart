import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafqud/features/add_post/cubit/add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());
}
