// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:charts_common/common.dart' as common
    show
        BehaviorPosition,
        ChartBehavior,
        ChartTitle,
        ChartTitleDirection,
        MaxWidthStrategy,
        OutsideJustification,
        TextStyleSpec;
import 'package:meta/meta.dart' show immutable;

import '../chart_behavior.dart' show ChartBehavior, GestureType;

/// Chart behavior that adds a ChartTitle widget to a chart.
@immutable
class ChartTitle<D> extends ChartBehavior<D> {
  final desiredGestures = <GestureType>{};

  final common.BehaviorPosition? behaviorPosition;

  /// Minimum size of the legend component. Optional.
  final int? layoutMinSize;

  /// Preferred size of the legend component. Defaults to 0.
  final int? layoutPreferredSize;

  /// Strategy for handling title text that is too large to fit.
  final common.MaxWidthStrategy? maxWidthStrategy;

  /// Primary text for the title.
  final String title;

  /// Direction of the chart title text.
  final common.ChartTitleDirection? titleDirection;

  /// Justification of the title text if it is positioned outside of the draw area.
  final common.OutsideJustification? titleOutsideJustification;

  /// Space between the title and sub-title text, if defined.
  final int? titlePadding;

  /// Style of the [title] text.
  final common.TextStyleSpec? titleStyleSpec;

  /// Secondary text for the sub-title.
  final String? subTitle;

  /// Style of the [subTitle] text.
  final common.TextStyleSpec? subTitleStyleSpec;

  /// Space between the "inside" of the chart, and the title behavior itself.
  final int? innerPadding;

  /// Space between the "outside" of the chart, and the title behavior itself.
  final int? outerPadding;

  /// Constructs a [ChartTitle].
  ChartTitle(
    this.title, {
    this.behaviorPosition,
    this.innerPadding,
    this.layoutMinSize,
    this.layoutPreferredSize,
    this.outerPadding,
    this.maxWidthStrategy,
    this.titleDirection,
    this.titleOutsideJustification,
    this.titlePadding,
    this.titleStyleSpec,
    this.subTitle,
    this.subTitleStyleSpec,
  });

  @override
  common.ChartTitle<D> createCommonBehavior() => common.ChartTitle<D>(
        title,
        behaviorPosition: behaviorPosition,
        innerPadding: innerPadding,
        layoutMinSize: layoutMinSize,
        layoutPreferredSize: layoutPreferredSize,
        outerPadding: outerPadding,
        maxWidthStrategy: maxWidthStrategy,
        titleDirection: titleDirection,
        titleOutsideJustification: titleOutsideJustification,
        titlePadding: titlePadding,
        titleStyleSpec: titleStyleSpec,
        subTitle: subTitle,
        subTitleStyleSpec: subTitleStyleSpec,
      );

  @override
  void updateCommonBehavior(common.ChartBehavior commonBehavior) {}

  @override
  String get role => 'ChartTitle-${behaviorPosition.toString()}';

  @override
  bool operator ==(Object o) {
    return o is ChartTitle &&
        behaviorPosition == o.behaviorPosition &&
        layoutMinSize == o.layoutMinSize &&
        layoutPreferredSize == o.layoutPreferredSize &&
        maxWidthStrategy == o.maxWidthStrategy &&
        title == o.title &&
        titleDirection == o.titleDirection &&
        titleOutsideJustification == o.titleOutsideJustification &&
        titleStyleSpec == o.titleStyleSpec &&
        subTitle == o.subTitle &&
        subTitleStyleSpec == o.subTitleStyleSpec &&
        innerPadding == o.innerPadding &&
        titlePadding == o.titlePadding &&
        outerPadding == o.outerPadding;
  }

  @override
  int get hashCode {
    return Object.hash(
      behaviorPosition,
      layoutMinSize,
      layoutPreferredSize,
      maxWidthStrategy,
      title,
      titleDirection,
      titleOutsideJustification,
      titleStyleSpec,
      subTitle,
      subTitleStyleSpec,
      innerPadding,
      titlePadding,
      outerPadding,
    );
  }
}
