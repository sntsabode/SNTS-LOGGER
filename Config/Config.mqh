//+------------------------------------------------------------------+
//|                                                       Config.mqh |
//|                                      Sebastion (sntsixx) de Mase |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Sebastion (sntsixx) de Mase"
#property link      "https://www.mql5.com"

#include "../LogLevels/LogLevels.mqh"

/**
 * Global Logger State (Static)
 */
class SNTS_LOGGER_CONFIGURATION
{
public:
   static int fileHandle;
   
   static bool logToFile;
   static bool logToTerminal;
   static bool logToChart;
   
   static bool csvMode;
   
   static string fileName;
   static string projectName;
   
   static ENUM_SNTS_LOGGER_LEVEL minLevel;
   
   static bool logDayInTimestamp;
   static bool logSecInTimestamp;
};

/**
 * Static Definitions
 */
int SNTS_LOGGER_CONFIGURATION::fileHandle = INVALID_HANDLE;
bool SNTS_LOGGER_CONFIGURATION::logToFile = true;
bool SNTS_LOGGER_CONFIGURATION::logToTerminal = true;
bool SNTS_LOGGER_CONFIGURATION::logToChart = false;
bool SNTS_LOGGER_CONFIGURATION::csvMode = false;
string SNTS_LOGGER_CONFIGURATION::fileName = "";
string SNTS_LOGGER_CONFIGURATION::projectName = "SNTS_PROJECT";
ENUM_SNTS_LOGGER_LEVEL SNTS_LOGGER_CONFIGURATION::minLevel = SNTS_LOGGER_LEVEL_ERROR;
bool SNTS_LOGGER_CONFIGURATION::logDayInTimestamp = true;
bool SNTS_LOGGER_CONFIGURATION::logSecInTimestamp = true;
