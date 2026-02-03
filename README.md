# ♠ SNTS'LOGGER

A simple yet powerful logging library for MQL5.

## 🚀 Features

*   **Multiple Log Levels**: Supports `TRACE` 📝, `DEBUG` 🐛, `INFO` ℹ️, `WARN` ⚠️, `ERROR` ❌, and `FATAL` 💀 log levels.
*   **Log Domains**: Categorize logs by domain (`GENERAL` 🌐, `TRADE` 📈, `MARKET` 📊, `RISK` 📉, `ML` 🧠, `IO` 💾, `CONFIG` ⚙️, `SYSTEM` 💻).
*   **Multiple Output Options**: Log to the terminal 🖥️, a file 📄, or the chart 📈.
*   **CSV Formatting**: Output logs in CSV format for easy parsing and analysis 📊.
*   **Configurable**: Easily configure the logger to suit your needs 🔧.
*   **Timestamping**: Automatically adds timestamps to your log messages 🕒.

## 📦 Installation

1.  📥 Download the `SNTS_LOGGER` repository.
2.  📁 Place the `SNTS_LOGGER` directory in your MQL5 `Include` directory (e.g., `PATH_TO\MQL5\Include\`).

## 💻 Usage

```cpp
#include <SNTS_LOGGER/SNTS_LOGGER.mqh>

void OnStart()
{
    // Configure the logger
    SNTS_LOGGER::Configure("MyExpertAdvisor", true, true, false, false, SNTS_LOGGER_LEVEL_INFO);

    // Log messages
    SNTS_LOGGER::TRACE("This is a trace message."); // This will not be logged because the minimum level is INFO
    SNTS_LOGGER::DEBUG("This is a debug message."); // This will not be logged because the minimum level is INFO
    SNTS_LOGGER::INFO("This is an info message.");
    SNTS_LOGGER::WARN("This is a warning message.");
    SNTS_LOGGER::ERROR("This is an error message.");
    SNTS_LOGGER::ERROR(123, "This is an error message with a subcode.");
    SNTS_LOGGER::ERROR(SNTS_LOGGER_TRADE_ERROR, 456, "This is a trade error message.");
    SNTS_LOGGER::FATAL(789, "This is a fatal error message.");
}
```

## ⚙️ Configuration

The `Configure` method allows you to customize the logger's behavior.

```cpp
void SNTS_LOGGER::Configure(
    string project,
    bool fileOutput = false,
    bool terminalOutput = true,
    bool chartOutput = false,
    bool useCSV = false,
    ENUM_SNTS_LOGGER_LEVEL minimumLevel = SNTS_LOGGER_LEVEL_TRACE,
    bool logDayInTimestamp = true,
    bool logSecInTimestamp = true
);
```

| Parameter         | Description                                                               |
| ----------------- | ------------------------------------------------------------------------- |
| `project`         | The name of your project.                                                 |
| `fileOutput`      | Set to `true` to log to a file. 📄                                        |
| `terminalOutput`  | Set to `true` to log to the terminal. 🖥️                                  |
| `chartOutput`     | Set to `true` to log to the chart. 📈                                     |
| `useCSV`          | Set to `true` to format logs as CSV. 📊                                   |
| `minimumLevel`    | The minimum log level to output.                                          |
| `logDayInTimestamp` | Set to `true` to include the day in the timestamp. 🕒                   |
| `logSecInTimestamp` | Set to `true` to include the seconds in the timestamp. 🕒               |

## 📊 Logging Levels

| Level   | Description                                                                 |
| ------- | --------------------------------------------------------------------------- |
| `TRACE` | Detailed information, typically used for debugging. 📝                      |
| `DEBUG` | Information that is useful for debugging. 🐛                                |
| `INFO`  | General information about the application's state. ℹ️                       |
| `WARN`  | Indicates a potential problem. ⚠️                                           |
| `ERROR` | Indicates a problem that should be investigated. ❌                         |
| `FATAL` | A critical error that may cause the application to terminate. 💀            |
| `OFF`   | Disables logging. 🔕                                                          |

## 🌐 Logging Domains

| Domain    | Description                               |
| --------- | ----------------------------------------- |
| `GENERAL` | General-purpose logging. 🌐               |
| `TRADE`   | For logging related to trading operations. 📈 |
| `MARKET`  | For logging related to market data. 📊    |
| `RISK`    | For logging related to risk management. 📉 |
| `ML`      | For logging related to machine learning. 🧠 |
| `IO`      | For logging related to input/output. 💾   |
| `CONFIG`  | For logging related to configuration. ⚙️   |
| `SYSTEM`  | For logging related to system-level events. 💻 |

## ❌ Error Handling

The `ERROR` method has several overloads for more specific error logging:

```cpp
// Log a simple error message
void SNTS_LOGGER::ERROR(string msg);

// Log an error with a subcode
void SNTS_LOGGER::ERROR(int subcode, string msg);

// Log an error with an error type and subcode
void SNTS_LOGGER::ERROR(ENUM_SNTS_LOGGER_ERROR_TYPE errorType, int subcode, string msg);

// Log an error with an error type
void SNTS_LOGGER::ERROR(ENUM_SNTS_LOGGER_ERROR_TYPE errorType, string msg);
```

## 👨‍💻 Author

Sebastion (sntsixx) de Mase

## 📄 License

This project is licensed under the [MIT License](LICENSE).
