import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/controller.dart';
import 'package:flutter_custom_calendar/model/date_model.dart';
import 'package:flutter/foundation.dart';

/**
 * 配置信息类
 */
class CalendarConfiguration {
  //默认是单选,可以配置为MODE_SINGLE_SELECT，MODE_MULTI_SELECT
  int selectMode;

  //仅展示月视图，仅展示周视图，支持月视图和周视图切换
  int showMode;

  //日历显示的最小年份和最大年份
  int minYear;
  int maxYear;

  //日历显示的前几天,后几天
  int preDay;//新增：往前几天 都为正数
  int nextDay;//新增：往后几天 都为正数
  int startDayCompareWithToady;//新增:从哪天开始，默认是0  -1表示从昨天开始，1表示从明天开始

  int minDay;//新增：最小的天数
  int maxDay;//新增：最大的天数
  int selectType;//新增

  //日历显示的最小年份的月份，最大年份的月份
  int minYearMonth;
  int maxYearMonth;

  //日历显示的当前的年份和月份
  int nowYear;
  int nowMonth;

  //可操作的范围设置,比如点击选择
  int minSelectYear;
  int minSelectMonth;
  int minSelectDay;

  int maxSelectYear;
  int maxSelectMonth;
  int maxSelectDay; //注意：不能超过对应月份的总天数

  DateModel selectDateModel; //默认被选中的item，用于单选
  HashSet<DateModel> defaultSelectedDateList; //默认被选中的日期set，用于多选
  int maxMultiSelectCount; //多选，最多选多少个
  Map<DateModel, Object> extraDataMap = new Map(); //自定义额外的数据

  /**
   * UI绘制方面的绘制
   */
  double itemSize; //默认是屏幕宽度/7
  double verticalSpacing; //日历item之间的竖直方向间距，默认10
  BoxDecoration boxDecoration; //整体的背景设置
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;

  //支持自定义绘制
  DayWidgetBuilder dayWidgetBuilder; //创建日历item
  WeekBarItemWidgetBuilder weekBarItemWidgetBuilder; //创建顶部的weekbar

  /**
   * 监听变化
   */
  //各种事件回调
  OnMonthChange monthChange; //月份切换事件 （已弃用,交给multiMonthChanges来实现）
  OnCalendarSelect calendarSelect; //点击选择事件
  OnMultiSelectOutOfRange multiSelectOutOfRange; //多选超出指定范围
  OnMultiSelectOutOfSize multiSelectOutOfSize; //多选超出限制个数

  ObserverList<OnMonthChange> monthChangeListeners =
  ObserverList<OnMonthChange>(); //保存多个月份监听的事件
  ObserverList<OnWeekChange> weekChangeListeners =
  ObserverList<OnWeekChange>(); //周视图切换

  /**
   * 下面的信息不是配置的，是根据配置信息进行计算出来的
   */
  List<DateModel> monthList = new List(); //月份list
  List<DateModel> weekList = new List(); //星期list
  PageController monthController; //月份的controller
  PageController weekController; //星期的controller
  DateModel minSelectDate;
  DateModel maxSelectDate;

  CalendarConfiguration(
      {this.selectMode,
        this.minYear,
        this.maxYear,
        this.preDay,
        this.nextDay,
        this.minDay,
        this.maxDay,
        this.selectType,
        this.startDayCompareWithToady,
        this.minYearMonth,
        this.maxYearMonth,
        this.nowYear,
        this.nowMonth,
        this.minSelectYear,
        this.minSelectMonth,
        this.minSelectDay,
        this.maxSelectYear,
        this.maxSelectMonth,
        this.maxSelectDay,
        this.defaultSelectedDateList,
        this.selectDateModel,
        this.maxMultiSelectCount,
        this.extraDataMap,
        this.monthList,
        this.weekList,
        this.monthController,
        this.weekController,
        this.verticalSpacing,
        this.itemSize,
        this.showMode,
        this.padding,
        this.margin});

  @override
  String toString() {
    return 'CalendarConfiguration{selectMode: $selectMode, minYear: $minYear, maxYear: $maxYear, preDay: $preDay, nextDay: $nextDay, minDay: $minDay, maxDay: $maxDay, selectType: $selectType, startDayCompareWithToady: $startDayCompareWithToady, minYearMonth: $minYearMonth, maxYearMonth: $maxYearMonth, nowYear: $nowYear, nowMonth: $nowMonth, minSelectYear: $minSelectYear, minSelectMonth: $minSelectMonth, minSelectDay: $minSelectDay, maxSelectYear: $maxSelectYear, maxSelectMonth: $maxSelectMonth, maxSelectDay: $maxSelectDay, defaultSelectedDateList: $defaultSelectedDateList, maxMultiSelectCount: $maxMultiSelectCount, extraDataMap: $extraDataMap, monthList: $monthList, weekList: $weekList, monthController: $monthController, weekController: $weekController}';
  }
}
