class AnnouncementModel {
  final String id;
  final String title;
  final String content;
  final String priority; // low, medium, high, urgent
  final String targetAudience; // all, students, teachers, parents
  final DateTime publishDate;
  final DateTime? expiryDate;
  final bool isPinned;
  final String authorId;
  final String authorName;

  AnnouncementModel({
    required this.id,
    required this.title,
    required this.content,
    required this.priority,
    required this.targetAudience,
    required this.publishDate,
    this.expiryDate,
    required this.isPinned,
    required this.authorId,
    required this.authorName,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      priority: json['priority'],
      targetAudience: json['targetAudience'],
      publishDate: DateTime.parse(json['publishDate']),
      expiryDate: json['expiryDate'] != null ? DateTime.parse(json['expiryDate']) : null,
      isPinned: json['isPinned'],
      authorId: json['authorId'],
      authorName: json['authorName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'priority': priority,
      'targetAudience': targetAudience,
      'publishDate': publishDate.toIso8601String(),
      'expiryDate': expiryDate?.toIso8601String(),
      'isPinned': isPinned,
      'authorId': authorId,
      'authorName': authorName,
    };
  }
}


class AnnouncementDummyData {
  static List<AnnouncementModel> getAllAnnouncements() {
    return [
      // Pinned & Urgent
      AnnouncementModel(
        id: 'ANN-001',
        title: 'امتحانات نهاية الفصل الدراسي',
        content:
            'تبدأ امتحانات نهاية الفصل الدراسي الأول يوم 20 ديسمبر 2025. الرجاء مراجعة الجدول الزمني للامتحانات المنشور على لوحة الإعلانات. نتمنى لجميع الطلاب التوفيق والنجاح.',
        priority: 'urgent',
        targetAudience: 'all',
        publishDate: DateTime.now().subtract(Duration(hours: 2)),
        expiryDate: DateTime.now().add(Duration(days: 15)),
        isPinned: true,
        authorId: 'admin001',
        authorName: 'إدارة المدرسة',
      ),
      
      // Pinned & High Priority
      AnnouncementModel(
        id: 'ANN-002',
        title: 'اجتماع أولياء الأمور',
        content:
            'يسر المدرسة دعوتكم لحضور اجتماع أولياء الأمور يوم الأحد 15 ديسمبر 2025 الساعة 10:00 صباحاً في قاعة الاجتماعات الرئيسية. سيتم مناقشة مستوى الطلاب والخطة الدراسية للفصل الثاني.',
        priority: 'high',
        targetAudience: 'parents',
        publishDate: DateTime.now().subtract(Duration(days: 1)),
        expiryDate: DateTime.now().add(Duration(days: 7)),
        isPinned: true,
        authorId: 'admin001',
        authorName: 'إدارة المدرسة',
      ),

      // High Priority - Teachers
      AnnouncementModel(
        id: 'ANN-003',
        title: 'ورشة عمل: استراتيجيات التدريس الحديثة',
        content:
            'ستقام ورشة عمل حول استراتيجيات التدريس الحديثة واستخدام التكنولوجيا في التعليم يوم الأربعاء 13 ديسمبر في قاعة التدريب من الساعة 2:00 إلى 5:00 مساءً. الحضور إلزامي لجميع المعلمين.',
        priority: 'high',
        targetAudience: 'teachers',
        publishDate: DateTime.now().subtract(Duration(days: 2)),
        expiryDate: DateTime.now().add(Duration(days: 5)),
        isPinned: false,
        authorId: 'hr001',
        authorName: 'إدارة الموارد البشرية',
      ),

      // Medium Priority
      AnnouncementModel(
        id: 'ANN-004',
        title: 'إجازة نصف العام الدراسي',
        content:
            'تبدأ إجازة نصف العام الدراسي من يوم 30 ديسمبر 2025 وتستمر لمدة أسبوعين. تعود الدراسة يوم 13 يناير 2026. نتمنى لجميع الطلاب والمعلمين إجازة سعيدة وممتعة.',
        priority: 'medium',
        targetAudience: 'all',
        publishDate: DateTime.now().subtract(Duration(days: 3)),
        expiryDate: DateTime.now().add(Duration(days: 25)),
        isPinned: false,
        authorId: 'admin001',
        authorName: 'إدارة المدرسة',
      ),

      // Medium Priority - Students
      AnnouncementModel(
        id: 'ANN-005',
        title: 'مسابقة القراءة السنوية',
        content:
            'تعلن المدرسة عن بدء التسجيل في مسابقة القراءة السنوية. الجائزة الأولى 500 جنيه. آخر موعد للتسجيل 18 ديسمبر. للاشتراك مراجعة مكتبة المدرسة.',
        priority: 'medium',
        targetAudience: 'students',
        publishDate: DateTime.now().subtract(Duration(days: 4)),
        expiryDate: DateTime.now().add(Duration(days: 10)),
        isPinned: false,
        authorId: 'lib001',
        authorName: 'أمينة المكتبة',
      ),

      // Low Priority
      AnnouncementModel(
        id: 'ANN-006',
        title: 'تحديث نظام الحضور الإلكتروني',
        content:
            'تم تحديث نظام الحضور الإلكتروني ليشمل ميزات جديدة. يمكنكم الآن الاطلاع على تقارير الحضور الشهرية من خلال حسابكم الشخصي.',
        priority: 'low',
        targetAudience: 'all',
        publishDate: DateTime.now().subtract(Duration(days: 5)),
        isPinned: false,
        authorId: 'tech001',
        authorName: 'قسم تكنولوجيا المعلومات',
      ),

      // Low Priority - Teachers
      AnnouncementModel(
        id: 'ANN-007',
        title: 'موعد تسليم تقارير الطلاب',
        content:
            'نذكر السادة المعلمين بموعد تسليم تقارير تقييم الطلاب للفصل الأول. آخر موعد للتسليم هو 25 ديسمبر.',
        priority: 'low',
        targetAudience: 'teachers',
        publishDate: DateTime.now().subtract(Duration(days: 7)),
        expiryDate: DateTime.now().add(Duration(days: 18)),
        isPinned: false,
        authorId: 'admin001',
        authorName: 'إدارة المدرسة',
      ),

      // Urgent - Students
      AnnouncementModel(
        id: 'ANN-008',
        title: 'تعليق الدراسة غداً',
        content:
            'نظراً للظروف الجوية السيئة، تقرر تعليق الدراسة ليوم غد الأحد. سيتم إبلاغكم بموعد استئناف الدراسة عبر الموقع الإلكتروني.',
        priority: 'urgent',
        targetAudience: 'all',
        publishDate: DateTime.now().subtract(Duration(hours: 5)),
        expiryDate: DateTime.now().add(Duration(days: 1)),
        isPinned: false,
        authorId: 'admin001',
        authorName: 'إدارة المدرسة',
      ),

      // Medium - Parents
      AnnouncementModel(
        id: 'ANN-009',
        title: 'نتائج الفصل الأول متاحة الآن',
        content:
            'يسعدنا إبلاغكم بأن نتائج الفصل الدراسي الأول أصبحت متاحة الآن. يمكنكم الاطلاع عليها من خلال حسابكم على المنصة الإلكترونية.',
        priority: 'medium',
        targetAudience: 'parents',
        publishDate: DateTime.now().subtract(Duration(hours: 10)),
        isPinned: false,
        authorId: 'admin001',
        authorName: 'إدارة المدرسة',
      ),

      // High - Students
      AnnouncementModel(
        id: 'ANN-010',
        title: 'يوم رياضي مفتوح',
        content:
            'تنظم المدرسة يوماً رياضياً مفتوحاً يوم الخميس القادم. سيتم إقامة مسابقات متنوعة في كرة القدم والسلة والطائرة. التسجيل مفتوح حتى الثلاثاء.',
        priority: 'high',
        targetAudience: 'students',
        publishDate: DateTime.now().subtract(Duration(hours: 15)),
        expiryDate: DateTime.now().add(Duration(days: 4)),
        isPinned: false,
        authorId: 'sport001',
        authorName: 'قسم التربية الرياضية',
      ),
    ];
  }

  // Get announcements by priority
  static List<AnnouncementModel> getByPriority(String priority) {
    return getAllAnnouncements()
        .where((a) => a.priority == priority)
        .toList();
  }

  // Get announcements by target audience
  static List<AnnouncementModel> getByTargetAudience(String target) {
    return getAllAnnouncements()
        .where((a) => a.targetAudience == target || a.targetAudience == 'all')
        .toList();
  }

  // Get pinned announcements
  static List<AnnouncementModel> getPinnedAnnouncements() {
    return getAllAnnouncements().where((a) => a.isPinned).toList();
  }

  // Get active announcements (not expired)
  static List<AnnouncementModel> getActiveAnnouncements() {
    final now = DateTime.now();
    return getAllAnnouncements().where((a) {
      if (a.expiryDate == null) return true;
      return a.expiryDate!.isAfter(now);
    }).toList();
  }
}
