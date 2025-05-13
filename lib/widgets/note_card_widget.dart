import 'package:flutter/material.dart';
import 'package:flutter_notes_app/controller/home/notes_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_notes_app/model/notes_model.dart';

class NoteCard extends StatelessWidget {
  final MNotes note;
  final NotesController notesController;

  const NoteCard({
    super.key,
    required this.note,
    required this.notesController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade800),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title ?? 'No Title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Text(
            note.description ?? 'No Description',
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                note.createdAt != null
                    ? (note.createdAt as String).substring(0, 10)
                    : 'No Date',
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text('Delete Note'),
                          content: const Text(
                            'Are you sure you want to delete this note?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                notesController.deleteNote(note.id!);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
