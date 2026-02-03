//+------------------------------------------------------------------+
//|                                                   LogDomains.mqh |
//|                                      Sebastion (sntsixx) de Mase |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Sebastion (sntsixx) de Mase"
#property link      "https://www.mql5.com"

/**
 * Error Domains (Subsystem Classification)
 */
enum ENUM_SNTS_LOGGER_DOMAIN
{
   SNTS_DOMAIN_GENERAL = 0,
   SNTS_DOMAIN_TRADE   = 1000,
   SNTS_DOMAIN_MARKET  = 2000,
   SNTS_DOMAIN_RISK    = 3000,
   SNTS_DOMAIN_ML      = 4000,
   SNTS_DOMAIN_IO      = 5000,
   SNTS_DOMAIN_CONFIG  = 6000,
   SNTS_DOMAIN_SYSTEM  = 9000
};
