//+------------------------------------------------------------------+
//|                                                    LogLevels.mqh |
//|                                      Sebastion (sntsixx) de Mase |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Sebastion (sntsixx) de Mase"
#property link      "https://www.mql5.com"

enum ENUM_SNTS_LOGGER_LEVEL
{
   /**
    * The most granular level, providing step-by-step
    * details of code execution, often used for extended
    * debugging sessions.
    *
    * TRACE -> DEBUG -> INFO -> WARN -> ERROR -> FATAL
    */
   SNTS_LOGGER_LEVEL_TRACE = 6,
   /**
    * Detailed diagnostic information useful for developers
    * to troubleshoot issues during development. These
    * messages are typically not intended for end-users.
    *
    * DEBUG -> INFO -> WARN -> ERROR -> FATAL
    */
   SNTS_LOGGER_LEVEL_DEBUG = 5,
   /**
    * General operational messages that confirm normal and
    * expected behavior of the system, such as a service
    * starting or a process completing successfully.
    *
    * INFO -> WARN -> ERROR -> FATAL
    */
   SNTS_LOGGER_LEVEL_INFO = 4,
   /**
    * Indicates an unexpected application behavior or a
    * potential issue that might become a problem if not
    * addressed, but the core functionality continues to work.
    *
    * WARN -> ERROR -> FATAL
    */
   SNTS_LOGGER_LEVEL_WARN = 3,
   /**
    * Signifies that a specific functionality has malfunctioned
    * or an issue has occurred that requires attention to restore
    * normal operations.
    *
    * ERROR -> FATAL
    */
   SNTS_LOGGER_LEVEL_ERROR = 2,
   /**
    * Reserved for severe errors that cause the failure of critical
    * components or the entire system, requiring immediate attention
    * and potentially leading to a program crash.
    *
    * FATAL
    */
   SNTS_LOGGER_LEVEL_FATAL = 1,
   /**
    * Logger is off... Nothing is logged.
    */
   SNTS_LOGGER_LEVEL_OFF = 0,
   /**
    *
    */
   SNTS_LOGGER_LEVEL_INPUT_INVALID = -1
};
