connection: "sy-bigquery-looker_demo"

# include all the views
include: "/views/bigquery/*.view"

datagroup: sy_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sy_demo_default_datagroup

explore: call_weather_report {
     join: seoul_weather_2018 {
       type: inner
       sql_on: ${call_weather_report.addr_sido} = ${seoul_weather_2018.sido}
              AND ${call_weather_report.addr_sigungu} = ${seoul_weather_2018.gungu}
              AND SUBSTR(${call_weather_report.addr_dong}, 0, 2) = ${seoul_weather_2018.dong}
              AND ${call_weather_report.date_string} = ${seoul_weather_2018.date}
              AND ${call_weather_report.time_tier} = ${seoul_weather_2018.hour};;
       relationship: one_to_one
      }
  hidden: yes
}

explore: call_population_report {
  join: seoul_population {
    type: inner
    sql_on: ${call_population_report.addr_sido} = ${seoul_population.sido}
              AND ${call_population_report.addr_sigungu} = ${seoul_population.gungu}
              AND SUBSTR(${call_population_report.addr_dong}, 0, 2) = ${seoul_population.dongmyeon};;
    relationship: one_to_one
  }
  hidden: yes
}


explore: call_delivery {
  hidden: yes
}

explore: seoul_weather_2018 {
  hidden: yes
}
explore: seoul_population {
  hidden: yes
}

explore: seoul_households {
  hidden: yes
}
