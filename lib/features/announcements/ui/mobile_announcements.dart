import 'package:edugate/features/announcements/data/announcement_model.dart';
import 'package:edugate/features/announcements/ui/widgets/announce_empty_state.dart';
import 'package:edugate/features/announcements/ui/widgets/announcement_card.dart';
import 'package:edugate/features/announcements/ui/widgets/announcement_filter_bar.dart';
import 'package:edugate/features/announcements/ui/widgets/create_announcement_sheet.dart';
import 'package:flutter/material.dart';

class MobileAnnouncementsScreen extends StatefulWidget {
  const MobileAnnouncementsScreen({super.key});

  @override
  State<MobileAnnouncementsScreen> createState() =>
      _MobileAnnouncementsScreenState();
}

class _MobileAnnouncementsScreenState extends State<MobileAnnouncementsScreen> {
  String _selectedFilter = 'all';
  List<AnnouncementModel> _announcements = [];

  @override
  void initState() {
    super.initState();
    _loadAnnouncements();
  }

  void _loadAnnouncements() {
    setState(() {
      _announcements = AnnouncementDummyData.getActiveAnnouncements();
    });
  }

  List<AnnouncementModel> get _filteredAnnouncements {
    if (_selectedFilter == 'all') {
      return _announcements;
    }

    // Filter by priority
    if (['urgent', 'high', 'medium', 'low'].contains(_selectedFilter)) {
      return _announcements
          .where((a) => a.priority == _selectedFilter)
          .toList();
    }

    // Filter by target audience
    return _announcements
        .where(
          (a) =>
              a.targetAudience == _selectedFilter || a.targetAudience == 'all',
        )
        .toList();
  }

  List<AnnouncementModel> get _pinnedAnnouncements {
    return _filteredAnnouncements.where((a) => a.isPinned).toList();
  }

  List<AnnouncementModel> get _regularAnnouncements {
    return _filteredAnnouncements.where((a) => !a.isPinned).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C3AED),
        elevation: 0,
        title: Text(
          'الإعلانات',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: _loadAnnouncements,
            tooltip: 'تحديث',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateAnnouncementSheet(),
        icon: Icon(Icons.add),
        label: Text('إعلان جديد'),
        backgroundColor: Color(0xFF7C3AED),
      ),
      body: Column(
        children: [
          AnnouncementFilterBar(
            selectedFilter: _selectedFilter,
            onFilterChanged: (filter) {
              setState(() => _selectedFilter = filter);
            },
          ),
          Expanded(
            child: _filteredAnnouncements.isEmpty
                ? AnnounceEmptyState()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Pinned Announcements Section
                        if (_pinnedAnnouncements.isNotEmpty) ...[
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.push_pin,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'إعلانات مثبتة',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ..._pinnedAnnouncements.map((announcement) {
                            return AnnouncementCard(announcement: announcement);
                          }),
                        ],

                        // Regular Announcements Section
                        if (_regularAnnouncements.isNotEmpty) ...[
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: Text(
                              'جميع الإعلانات',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ..._regularAnnouncements.map((announcement) {
                            return AnnouncementCard(announcement: announcement);
                          }),
                        ],

                        SizedBox(height: 80),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _showCreateAnnouncementSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CreateAnnouncementSheet(
        onAnnouncementCreated: () {
          _loadAnnouncements();
        },
      ),
    );
  }
}
