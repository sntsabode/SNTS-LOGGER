//+------------------------------------------------------------------+
//|                                                      LogFile.mqh |
//|                                      Sebastion (sntsixx) de Mase |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Sebastion (sntsixx) de Mase"
#property link      "https://www.mql5.com"

#include "../Config/Config.mqh"

class SNTS_FILE_LOGGER
{
public:
   static void Open()
   {
      if (SNTS_LOGGER_CONFIGURATION::fileHandle != INVALID_HANDLE)
      {
         FileClose(SNTS_LOGGER_CONFIGURATION::fileHandle);
      }

      string ext = SNTS_LOGGER_CONFIGURATION::csvMode ? ".csv" : ".log";
      SNTS_LOGGER_CONFIGURATION::fileName = SNTS_LOGGER_CONFIGURATION::projectName
         + "_"
         + TimeToString(TimeLocal(), TIME_DATE) + ext;

      int flags = FILE_WRITE | FILE_TXT | FILE_COMMON;
      if (SNTS_LOGGER_CONFIGURATION::csvMode)
      {
         flags = FILE_WRITE | FILE_CSV | FILE_COMMON;
      }

      SNTS_LOGGER_CONFIGURATION::fileHandle = FileOpen(SNTS_LOGGER_CONFIGURATION::fileName, flags);
      if (SNTS_LOGGER_CONFIGURATION::fileHandle == INVALID_HANDLE)
      {
         Print("LOGGER ERROR: Failed to open log file: ", SNTS_LOGGER_CONFIGURATION::fileName);
         return;
      }

      if (SNTS_LOGGER_CONFIGURATION::csvMode)
      {
         FileWrite(SNTS_LOGGER_CONFIGURATION::fileHandle, "Timestamp,Project,Level,Message");
      }
   }
   
   static void Write(string line)
   {
      if (SNTS_LOGGER_CONFIGURATION::fileHandle == INVALID_HANDLE) return;

      FileWrite(SNTS_LOGGER_CONFIGURATION::fileHandle, line);
      FileFlush(SNTS_LOGGER_CONFIGURATION::fileHandle);
   }
   
   static void Close()
   {
      if (SNTS_LOGGER_CONFIGURATION::fileHandle != INVALID_HANDLE)
      {
         FileClose(SNTS_LOGGER_CONFIGURATION::fileHandle);
         SNTS_LOGGER_CONFIGURATION::fileHandle = INVALID_HANDLE;
      }
   }
};
