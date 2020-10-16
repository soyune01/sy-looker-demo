view: call_delivery_pdt1 {
  derived_table: {
    sql: SELECT date
             , day
             , time_tier
             , industry_item
             , sum(call_cnt) as call_cnt
        FROM `stf-development.looker_demo.call_delivery`
        group by date, day, time_tier, industry_item;;
  #  sql_trigger_value: SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP());;


  }
  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: industry_item {
    type: string
    sql: ${TABLE}.industry_item ;;
  }

  dimension: call_cnt {
    type: number
    sql: ${TABLE}.call_cnt ;;
  }

  dimension: time_tier {
    type: string
    sql: ${TABLE}.time_tier ;;
  }
}
