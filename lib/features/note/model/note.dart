// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

part 'note.g.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required String title,
    required String body,
    @JsonKey(defaultValue: false) required bool isFav,
    required String date,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
