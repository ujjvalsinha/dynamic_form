part of 'dynamic_form_cubit.dart';

abstract class DynamicFormState extends Equatable {}

class DynamicFormLoading extends DynamicFormState {
  @override
  List<Object?> get props => [];
}

class DynamicFormLoaded extends DynamicFormState {
  final String formTitle;
  final List<DynamicFormViewModel> model;
  final String dateTime;

  DynamicFormLoaded({
    required this.model,
    required this.formTitle,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [model, formTitle, dateTime];
}

class DynamicFormError extends DynamicFormState {
  final String? message;

  DynamicFormError({required this.message});

  @override
  List<Object?> get props => [message];
}
