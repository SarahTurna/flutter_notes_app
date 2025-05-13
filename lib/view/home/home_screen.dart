import 'package:flutter/material.dart';
import 'package:flutter_notes_app/controller/home/notes_controller.dart';
import 'package:flutter_notes_app/widgets/note_card_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class HomeScreen extends StatelessWidget {
  final NotesController notesController = Get.put(NotesController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        actions: [
          IconButton(
            //three dots
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              //show a modal with settings.
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            // Search bar
            TextField(
              onChanged: (value) {
                // Implement search functionality here
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search your notes...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1F1F1F), // Darker background for search bar
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            // Notes list
            Expanded(
              child: Obx(() {
                if (notesController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (notesController.notes.isEmpty) {
                  return Center(
                    child: Text(
                      'No notes yet. Create one!',
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    ),
                  );
                } else {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 0.75, // Adjust as needed
                    ),
                    itemCount: notesController.notes.length,
                    itemBuilder: (context, index) {
                      final note = notesController.notes[index];
                      return NoteCard(note: note, notesController: notesController);
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Add Note screen
          //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNoteScreen()));
          GoRouter.of(context).push('/add-note'); // Use GoRouter
        },
        backgroundColor:
            const Color(0xFF6200EE), // Purple accent color, same as the image
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}




