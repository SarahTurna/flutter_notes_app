import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_notes_app/model/notes_model.dart';

class NotesController extends GetxController {
  final RxList<MNotes> notes = <MNotes>[].obs;
  final RxBool isLoading = false.obs;
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    isLoading.value = true;
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('User is not logged in.');
      }

      final List<dynamic> response = await _supabaseClient
          .from('notes')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      final List<MNotes> fetchedNotes =
          response
              .map((item) => MNotes.fromMap(item as Map<String, dynamic>))
              .toList();

      notes.value = fetchedNotes;
      debugPrint('Fetched notes: $notes');
    } catch (error) {
      Get.snackbar('Error', 'Failed to fetch notes: $error');
      notes.value = [];
      debugPrint('Error fetching notes: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addNote(
    String title,
    String description,
    BuildContext context,
  ) async {
    isLoading.value = true;
    try {
      final userId = _supabaseClient.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('User is not logged in.');
      }

      await _supabaseClient.from('notes').insert({
        'user_id': userId,
        'title': title,
        'description': description,
        'created_at': DateTime.now().toIso8601String(),
      });

      await fetchNotes();
      GoRouter.of(context).pop();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Note added successfully!')));
    } catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to add note: $error')));
      debugPrint('$error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteNote(String id) async {
    isLoading.value = true;
    try {
      await _supabaseClient.from('notes').delete().eq('id', id);
      await fetchNotes();
      Get.snackbar('Success', 'Note deleted successfully!');
    } catch (error) {
      Get.snackbar('Error', 'Failed to delete note: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await Supabase.instance.client.auth.signOut();

      GoRouter.of(context).goNamed('login');
    } catch (error) {
      debugPrint('Error signing out: $error');
    }
  }
}
