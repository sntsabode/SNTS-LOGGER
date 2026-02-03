//+------------------------------------------------------------------+
//|                                                        Utils.mqh |
//|                                      Sebastion (sntsixx) de Mase |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Sebastion (sntsixx) de Mase"
#property link      "https://www.mql5.com"

#include "../LogLevels/LogLevels.mqh"

ENUM_SNTS_LOGGER_LEVEL GetLogLevelFromString(string ll)
{
   if
   (
      ll == "ENUM_SNTS_LOGGER_LEVEL_TRACE" ||
      ll == "SNTS_LOGGER_LEVEL_TRACE" ||
      ll == "TRACE" ||
      ll == "T" ||
      ll == "6"
   ) return SNTS_LOGGER_LEVEL_TRACE;

   else if
   (
      ll == "SNTS_LOGGER_LEVEL_DEBUG" ||
      ll == "LOGGER_LEVEL_DEBUG" ||
      ll == "DEBUG" ||
      ll == "D" ||
      ll == "5"
   ) return SNTS_LOGGER_LEVEL_DEBUG;

   else if
   (
      ll == "SNTS_LOGGER_LEVEL_INFO" ||
      ll == "LOGGER_LEVEL_INFO" ||
      ll == "INFO" ||
      ll == "I" ||
      ll == "4"
   ) return SNTS_LOGGER_LEVEL_INFO;

   else if
   (
      ll == "ENUM_SNTS_LOGGER_LEVEL_WARN" ||
      ll == "SNTS_LOGGER_LEVEL_WARN" ||
      ll == "WARN" ||
      ll == "W" ||
      ll == "3"
   ) return SNTS_LOGGER_LEVEL_WARN;

   else if
   (
      ll == "ENUM_SNTS_LOGGER_LEVEL_ERROR" ||
      ll == "SNTS_LOGGER_LEVEL_ERROR" ||
      ll == "ERROR" ||
      ll == "E" ||
      ll == "2"
   ) return SNTS_LOGGER_LEVEL_ERROR;

   else if
   (
      ll == "ENUM_SNTS_LOGGER_LEVEL_FATAL" ||
      ll == "SNTS_LOGGER_LEVEL_FATAL" ||
      ll == "FATAL" ||
      ll == "F" ||
      ll == "1"
   ) return SNTS_LOGGER_LEVEL_FATAL;

   else if
   (
      ll == "ENUM_SNTS_LOGGER_LEVEL_OFF" ||
      ll == "SNTS_LOGGER_LEVEL_OFF" ||
      ll == "OFF" ||
      ll == "O" ||
      ll == "0"
   ) return SNTS_LOGGER_LEVEL_OFF;

   return SNTS_LOGGER_LEVEL_INPUT_INVALID;
}
