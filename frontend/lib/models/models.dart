// lib/models/models.dart
import 'package:flutter/material.dart';

// --- Tipos de conteúdo ---
enum ContentType { video, pdf }

// --- Tendência para KPIs ---
enum Trend { up, down, neutral }

// --- Modelo de Trilha (Trail) ---
class Trail {
  final String id;
  String name;
  String description;
  int contentCount;

  Trail({
    required this.id,
    required this.name,
    required this.description,
    required this.contentCount,
  });
}

// --- Modelo de Conteúdo (Content) ---
class Content {
  final String id;
  final String trailId;
  final ContentType type;
  String title;
  String description;
  final String uploadDate;
  final List<double> engagementData;
  final int views;
  final String dropoffPoint;

  Content({
    required this.id,
    required this.trailId,
    required this.type,
    required this.title,
    required this.description,
    required this.uploadDate,
    required this.engagementData,
    required this.views,
    required this.dropoffPoint,
  });
}

// --- Ponto de dados para gráficos (KPICard) ---
class ChartDataPoint {
  final double value;
  const ChartDataPoint({required this.value});
}

// --- Modelo de Estudante (StudentTable) ---
class Student {
  final int id;
  final String name;
  final String avatar;
  final String company;
  final String lastAccess;
  final int progress;
  final String status;

  const Student({
    required this.id,
    required this.name,
    required this.avatar,
    required this.company,
    required this.lastAccess,
    required this.progress,
    required this.status,
  });
}

// --- Modelo de Mensagem (ChatWidget) ---
class ChatMessage {
  final int id;
  final String studentName;
  final String studentAvatar;
  final String message;
  final String time;
  final bool unread;

  const ChatMessage({
    required this.id,
    required this.studentName,
    required this.studentAvatar,
    required this.message,
    required this.time,
    required this.unread,
  });
}