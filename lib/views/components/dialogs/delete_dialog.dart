import 'package:flutter/foundation.dart' show immutable;
import 'package:lomj/views/components/constants/strings.dart';
import 'package:lomj/views/components/dialogs/alert_dialog_model.dart';

@immutable
class DeletedDialog extends AlertDialogModel<bool> {
  const DeletedDialog({
    required String titleOfObjectToDelete,
  }) : super(
          title: '${Strings.delete} $titleOfObjectToDelete',
          message:
              '${Strings.areYouSureYouWantToDeleteThis} $titleOfObjectToDelete',
          buttons: const {
            Strings.cancel: false,
            Strings.delete: true,
          },
        );
}
