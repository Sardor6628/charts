import 'package:charts_common/common.dart' as common
    show Legend, LegendState, SeriesLegend;
import 'package:flutter/widgets.dart' show BuildContext, Widget;
import 'legend.dart';
import 'legend_entry_layout.dart';
import 'legend_layout.dart';

/// Strategy for building a legend content widget.
abstract class LegendContentBuilder {
  const LegendContentBuilder();

  Widget build(BuildContext context, common.LegendState legendState,
      common.Legend legend,
      {bool showMeasures});
}

/// Base strategy for building a legend content widget.
///
/// Each legend entry is passed to a [LegendLayout] strategy to create a widget
/// for each legend entry. These widgets are then passed to a
/// [LegendEntryLayout] strategy to create the legend widget.
abstract class BaseLegendContentBuilder implements LegendContentBuilder {
  /// Strategy for creating one widget for each legend entry.
  LegendEntryLayout get legendEntryLayout;

  /// Strategy for creating the legend content widget from a list of widgets.
  ///
  /// This is typically the list of widgets from legend entries.
  LegendLayout get legendLayout;

  @override
  Widget build(BuildContext context, common.LegendState legendState,
      common.Legend legend,
      {bool showMeasures = false}) {
    final entryWidgets = legendState.legendEntries.map((entry) {
      var isHidden = false;
      if (legend is common.SeriesLegend) {
        isHidden = legend.isSeriesHidden(entry.series.id);
      }

      return legendEntryLayout.build(
        context,
        entry,
        legend as TappableLegend,
        isHidden,
        showMeasures: showMeasures,
      );
    }).toList();

    return legendLayout.build(context, entryWidgets);
  }
}

/// Strategy that builds a tabular legend.
class TabularLegendContentBuilder extends BaseLegendContentBuilder {
  final LegendEntryLayout legendEntryLayout;
  final LegendLayout legendLayout;

  TabularLegendContentBuilder({
    LegendEntryLayout? legendEntryLayout,
    LegendLayout? legendLayout,
  })  : legendEntryLayout = legendEntryLayout ?? const SimpleLegendEntryLayout(),
        legendLayout = legendLayout ?? TabularLegendLayout.horizontalFirst();

  @override
  bool operator ==(Object o) {
    return o is TabularLegendContentBuilder &&
        legendEntryLayout == o.legendEntryLayout &&
        legendLayout == o.legendLayout;
  }

  @override
  int get hashCode => Object.hash(legendEntryLayout, legendLayout);
}