//+------------------------------------------------------------------+
//|                                                  SNTS_LOGGER.mqh |
//|                                      Sebastion (sntsixx) de Mase |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Sebastion (sntsixx) de Mase"
#property link      "https://www.mql5.com"

#include "/ErrorTypes/ErrorTypes.mqh"
#include "/LogDomains/LogDomains.mqh"
#include "/LogLevels/LogLevels.mqh"
#include "/LogFile/LogFile.mqh"
#include "/Config/Config.mqh"

#include <SNTS/SNTS_TIME/SNTS_TIME.mqh>;

class SNTS_LOGGER
{
private:
   static string Timestamp()
   {
      return SNTS_TIME::GetDatetimeString
      (
         TimeLocal(),
         SNTS_LOGGER_CONFIGURATION::logDayInTimestamp,
         SNTS_LOGGER_CONFIGURATION::logSecInTimestamp
      );
   }

   static string LevelToString(ENUM_SNTS_LOGGER_LEVEL level)
   {
      switch (level)
      {
         case SNTS_LOGGER_LEVEL_TRACE: return "TRACE";
         case SNTS_LOGGER_LEVEL_DEBUG: return "DEBUG";
         case SNTS_LOGGER_LEVEL_INFO:  return "INFO";
         case SNTS_LOGGER_LEVEL_WARN:  return "WARN";
         case SNTS_LOGGER_LEVEL_ERROR: return "ERROR";
         case SNTS_LOGGER_LEVEL_FATAL: return "FATAL";
         case SNTS_LOGGER_LEVEL_OFF:   return "OFF";
      }

      return "INVALID";
   }

   static string DomainToString(ENUM_SNTS_LOGGER_DOMAIN domain)
   {
      switch (domain)
      {
         case SNTS_DOMAIN_GENERAL: return "GENERAL";
         case SNTS_DOMAIN_TRADE:   return "TRADE";
         case SNTS_DOMAIN_MARKET:  return "MARKET";
         case SNTS_DOMAIN_RISK:    return "RISK";
         case SNTS_DOMAIN_ML:      return "ML";
         case SNTS_DOMAIN_IO:      return "IO";
         case SNTS_DOMAIN_CONFIG:  return "CONFIG";
         case SNTS_DOMAIN_SYSTEM:  return "SYSTEM";
      }

      return "INVALID";
   }

   static bool ShouldLog(ENUM_SNTS_LOGGER_LEVEL level)
   {
      if
      (
         SNTS_LOGGER_CONFIGURATION::minLevel == SNTS_LOGGER_LEVEL_OFF ||
         level == SNTS_LOGGER_LEVEL_INPUT_INVALID
      ) return false;

      return level <= SNTS_LOGGER_CONFIGURATION::minLevel;
   }

   static int MakeCode(ENUM_SNTS_LOGGER_DOMAIN domain, int subcode)
   {
      return (int)domain + subcode;
   }

   static void LOG
   (
      ENUM_SNTS_LOGGER_LEVEL level,
      ENUM_SNTS_LOGGER_DOMAIN domain,
      int subcode,
      string message
   )
   {

      if (!SNTS_LOGGER::ShouldLog(level)) return;

      int code = SNTS_LOGGER::MakeCode(domain, subcode);

      string time = SNTS_LOGGER::Timestamp();
      string lvl = SNTS_LOGGER::LevelToString(level);
      string dom = SNTS_LOGGER::DomainToString(domain);

      string line;
      if (SNTS_LOGGER_CONFIGURATION::csvMode)
      {
         line = time + "," +
            SNTS_LOGGER_CONFIGURATION::projectName + "," +
            lvl + "," +
            dom + "," +
            IntegerToString(code) + ",\"" +
            message + "\"";
      }

      else
      {
         line = time + " [" +
            SNTS_LOGGER_CONFIGURATION::projectName + "] [" +
            lvl + "][" +
            dom + "][" +
            IntegerToString(code) + "] " +
            message;
      }

      if (SNTS_LOGGER_CONFIGURATION::logToTerminal) Print(line);

      if (SNTS_LOGGER_CONFIGURATION::logToFile)
         SNTS_FILE_LOGGER::Write(line);

      if (SNTS_LOGGER_CONFIGURATION::logToChart) Comment(line);
   }

   static void LogError
   (
      ENUM_SNTS_LOGGER_LEVEL level,
      ENUM_SNTS_LOGGER_DOMAIN domain,
      int subcode,
      string message
   )
   {
      SNTS_LOGGER::LOG(level, domain, subcode, message);
   }

   static void Log(ENUM_SNTS_LOGGER_LEVEL level, string message)
   {
      SNTS_LOGGER::LOG(level, SNTS_DOMAIN_GENERAL, 0, message);
   }

public:
   static void Configure
   (
      string project,
      bool fileOutput = false,
      bool terminalOutput = true,
      bool chartOutput = false,
      bool useCSV = false,
      ENUM_SNTS_LOGGER_LEVEL minimumLevel = SNTS_LOGGER_LEVEL_TRACE,
      bool logDayInTimestamp = true,
      bool logSecInTimestamp = true
   )
   {
      SNTS_LOGGER_CONFIGURATION::projectName = project;
      SNTS_LOGGER_CONFIGURATION::logToFile = fileOutput;
      SNTS_LOGGER_CONFIGURATION::logToTerminal = terminalOutput;
      SNTS_LOGGER_CONFIGURATION::logToChart = chartOutput;
      SNTS_LOGGER_CONFIGURATION::csvMode = useCSV;
      SNTS_LOGGER_CONFIGURATION::minLevel = minimumLevel;
      SNTS_LOGGER_CONFIGURATION::logDayInTimestamp = logDayInTimestamp;
      SNTS_LOGGER_CONFIGURATION::logSecInTimestamp = logSecInTimestamp;

      if (fileOutput) SNTS_FILE_LOGGER::Open();
   }

   static void TRACE(string msg)
   {
      SNTS_LOGGER::Log(SNTS_LOGGER_LEVEL_TRACE, msg);
   }

   static void DEBUG(string msg)
   {
      SNTS_LOGGER::Log(SNTS_LOGGER_LEVEL_DEBUG, msg);
   }

   static void INFO(string msg)
   {
      SNTS_LOGGER::Log(SNTS_LOGGER_LEVEL_INFO, msg);
   }

   static void WARN(string msg)
   {
      SNTS_LOGGER::Log(SNTS_LOGGER_LEVEL_WARN, msg);
   }

   static void ERROR(string msg)
   {
      SNTS_LOGGER::LogError(SNTS_LOGGER_LEVEL_ERROR, SNTS_DOMAIN_GENERAL, 1, msg);
   }

   static void ERROR(int subcode, string msg)
   {
      SNTS_LOGGER::LogError(SNTS_LOGGER_LEVEL_ERROR, SNTS_DOMAIN_GENERAL, subcode, msg);
   }

   static void ERROR(ENUM_SNTS_LOGGER_ERROR_TYPE errorType, int subcode, string msg)
   {
      SNTS_LOGGER::LogError
      (
         SNTS_LOGGER_LEVEL_ERROR,
         errorType == SNTS_LOGGER_TRADE_ERROR
            ? SNTS_DOMAIN_TRADE
            : errorType == SNTS_LOGGER_MARKET_ERROR
            ? SNTS_DOMAIN_MARKET
            : SNTS_DOMAIN_GENERAL,
         subcode,
         msg
      );
   }

   static void ERROR(ENUM_SNTS_LOGGER_ERROR_TYPE errorType, string msg)
   {
      SNTS_LOGGER::LogError
      (
         SNTS_LOGGER_LEVEL_ERROR,
         errorType == SNTS_LOGGER_TRADE_ERROR
            ? SNTS_DOMAIN_TRADE
            : errorType == SNTS_LOGGER_MARKET_ERROR
            ? SNTS_DOMAIN_MARKET
            : SNTS_DOMAIN_GENERAL,
         1,
         msg
      );
   }

   static void FATAL(int subcode, string msg)
   {
      SNTS_LOGGER::LogError(SNTS_LOGGER_LEVEL_FATAL, SNTS_DOMAIN_SYSTEM, subcode, msg);
   }
};
