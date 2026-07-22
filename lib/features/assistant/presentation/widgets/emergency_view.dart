import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';
import 'package:syria_glow/core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyView extends StatelessWidget {
  const EmergencyView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contacts = [
      {
        'title': context.l10n.emergency_ambulance_title,
        'number': '110',
        'desc': context.l10n.emergency_ambulance_desc,
      },
      {
        'title': context.l10n.emergency_traffic_police_title,
        'number': '115',
        'desc': context.l10n.emergency_traffic_police_desc,
      },
      {
        'title': context.l10n.emergency_highway_patrol_title,
        'number': '115',
        'desc': context.l10n.emergency_highway_patrol_desc,
      },
      {
        'title': context.l10n.emergency_fire_defense_title,
        'number': '113',
        'desc': context.l10n.emergency_fire_defense_desc,
      },
      {
        'title': context.l10n.emergency_tourist_police_title,
        'number': '137',
        'desc': context.l10n.emergency_tourist_police_desc,
      },
      {
        'title': context.l10n.emergency_tourism_complaints_title,
        'number': '137',
        'desc': context.l10n.emergency_tourism_complaints_desc,
      },
      {
        'title': context.l10n.emergency_public_police_title,
        'number': '112',
        'desc': context.l10n.emergency_public_police_desc,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.primaryGreen),
        centerTitle: true,
        elevation: 0,
        title: Text(
          context.l10n.emergency_numbers_title,

          style: TextTheme.of(context).bodyLarge?.copyWith(
            color: AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          var contact = contacts[index];
          return Card(
            color: AppColors.backgroundLight,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.success, width: 1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              title: Text(
                maxLines: 1,

                contact['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  maxLines: 1,
                  contact['desc']!,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ),
              trailing: ElevatedButton.icon(
                onPressed: () {
                  makeCall(contact['number']!);
                },
                icon: Icon(Icons.call, size: 18.r, color: Colors.white),
                label: Text(
                  contact['number']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> makeCall(String number) async {
    final Uri launchUri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }
}
