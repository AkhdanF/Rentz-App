import 'package:flutter/material.dart';

class NotificationModel {
  final int id; // Unique identifier for notifications
  final String title;
  final String description;
  bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    this.isRead = false,
  });
}
