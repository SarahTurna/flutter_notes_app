# Flutter Notes App

### Description
This is a Flutter notes application that allows users to create, view, and delete notes. It uses Supabase for the backend, Get for state management, and GoRouter for navigation.

## Features
Online Database: Uses Supabase to store notes.
State Management: Uses Get for managing the application's state.
Navigation: Uses GoRouter for navigation.
Clean Architecture: The project follows a clean architecture.
Standard UI/UX: The application is designed with a standard UI/UX pattern.

## Technologies Used
Flutter
Supabase
Get
GoRouter
Installation
Clone the repository
git clone https://github.com/your-repository/flutter_notes_app.git


## Install dependencies
flutter pub get


## Set up Supabase
Create a project on Supabase (https://supabase.com/).
Create a table named notes with the following schema:
CREATE TABLE notes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id),
  title TEXT,
  description TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);


### Obtain your Supabase URL and API key from your project settings.
Configure Supabase credentials
Replace the supabaseUrl and supabaseKey in main.dart with your Supabase URL and API key.
const supabaseUrl = 'YOUR_SUPABASE_URL';
const supabaseKey = 'YOUR_SUPABASE_ANON_KEY';


## Run the application
flutter run
