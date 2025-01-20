import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:collection/collection.dart';
import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:elastic_dashboard/widgets/dialog_widgets/dialog_toggle_switch.dart';

class FilterDialog extends StatefulWidget {

  final bool Function() getHideMetadata;
  final Set<String> Function() getFilters;
  final void Function(bool value)? onMetadataChanged;
  final void Function(String data)? onFilterAdded;
  final void Function(String data)? onFilterRemoved;

  const SettingsDialog({
    super.key,
    this.getHideMetadata,
    this.getFilters,
    this.onMetadataChanged,
    this.onFilterAdded,
    this.onFilterRemoved,
  });

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Search Filters'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: SizedBox(
        width: 450,
        height: 400,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 355),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      ..._gridSettings(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }

  List<Widget> _gridSettings() {
    return [
      Flexible(
        child: DialogToggleSwitch(
          initialValue: widget.getHideMetadata.call(),
          label: 'Hide Metadata',
          onToggle: (value) {
            setState(() {
              widget.onMetadataChanged?.call(value);
            });
          },
        ),
      ),
      const Divider(),
      const Align(
        alignment: Alignment.topLeft,
        child: Text('Grid Settings'),
      ),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: DialogToggleSwitch(
              initialValue: //widget.preferences.getBool(PrefKeys.showGrid) ??
                  Defaults.showGrid,
              label: 'Show Grid',
              onToggle: (value) {
                setState(() {
                  // widget.onGridToggle?.call(value);
                });
              },
            ),
          ),
          Flexible(
            child: DialogTextInput(
              initialText:
                  //widget.preferences.getInt(PrefKeys.gridSize)?.toString() ??
                      Defaults.gridSize.toString(),
              label: 'Grid Size',
              onSubmit: (value) async {
                // await widget.onGridSizeChanged?.call(value);
                setState(() {});
              },
              formatter: FilteringTextInputFormatter.digitsOnly,
            ),
          )
        ],
      ),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 2,
            child: DialogTextInput(
              initialText:
                  (//widget.preferences.getDouble(PrefKeys.cornerRadius) ??
                          Defaults.cornerRadius.toString())
                      .toString(),
              label: 'Corner Radius',
              onSubmit: (value) {
                setState(() {
                  // widget.onCornerRadiusChanged?.call(value);
                });
              },
              formatter: TextFormatterBuilder.decimalTextFormatter(),
            ),
          ),
          Flexible(
            flex: 3,
            child: DialogToggleSwitch(
              initialValue:
                  //widget.preferences.getBool(PrefKeys.autoResizeToDS) ??
                      Defaults.autoResizeToDS,
              label: 'Resize to Driver Station Height',
              onToggle: (value) {
                setState(() {
                  //widget.onResizeToDSChanged?.call(value);
                });
              },
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 5,
            child: DialogToggleSwitch(
              initialValue:
                  //widget.preferences.getBool(PrefKeys.rememberWindowPosition) ??
                      false,
              label: 'Remember Window Position',
              onToggle: (value) {
                setState(() {
                  //widget.onRememberWindowPositionChanged?.call(value);
                });
              },
            ),
          ),
          Flexible(
            flex: 4,
            child: DialogToggleSwitch(
              initialValue: //widget.preferences.getBool(PrefKeys.layoutLocked) ??
                  Defaults.layoutLocked,
              label: 'Lock Layout',
              onToggle: (value) {
                setState(() {
                  //widget.onLayoutLock?.call(value);
                });
              },
            ),
          ),
        ],
      ),
    ];
  }
}
