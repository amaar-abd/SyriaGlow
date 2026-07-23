import 'package:flutter/material.dart';
import 'package:syria_glow/core/extensions/context_extensions.dart';

String getProvinceName(BuildContext context, String key) {
  final l10n = context.l10n;
  switch (key) {
    case 'damascus':
      return l10n.damascus;
    case 'Douma, Syria':
      return l10n.rif_dimashq;
    case 'aleppo':
      return l10n.aleppo;
    case 'homs':
      return l10n.homs;
    case 'hama':
      return l10n.hama;
    case 'latakia':
      return l10n.latakia;
    case 'tartous':
      return l10n.tartous;
    case 'idlib':
      return l10n.idlib;
    case 'sweida':
      return l10n.sweida;
    case 'Deraa, Syria':
      return l10n.daraa;
    case 'quneitra':
      return l10n.quneitra;
    case 'Deir ez-Zor':
      return l10n.deir_ez_zor;
    case 'raqqa, Syria':
      return l10n.raqqa;
    case 'hasakah':
      return l10n.hasakah;
    default:
      return key;
  }
}
