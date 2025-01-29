# High Drawdown Alert on MT4

This MT4 EA monitors your account’s drawdown in real time. When your drawdown reaches or exceeds a specified threshold that you can set, the EA sends a notification to your MT4 mobile app and displays an alert in the MT4 terminal. *Ensure to turn on push notifications in your app.*

## How It Works

- **Drawdown** in this context is calculated as `currentBalance - currentEquity`.
    - **Balance** is your closed profit/loss plus initial deposit.
    - **Equity** includes all open profit/loss in real time.
- If the difference between your balance and equity reaches the user-defined `maxDrawdownAllowed`, the EA sends you an alert and a push notification (if notifications are enabled in your MT4 platform).
- To prevent sending repeated alerts on every new price tick, the EA sets a flag (`alertSent`) once an alert is triggered. When the drawdown drops back below the threshold, the flag is reset, allowing fresh alerts if the drawdown crosses the threshold again in future.

## Features

1. **Real-time monitoring** of drawdown every market tick.
2. **Customisable drawdown threshold** so you can decide the exact currency amount at which you wish to be notified.
3. **No repeated alerts** once triggered, unless drawdown falls back below the threshold and then rises again.

## Requirements

- **MetaTrader 4**
- A trading account configured in MT4 (demo or live).
- Push notifications set up in your MT4 platform if you want mobile alerts:
    1. In MT4, go to **Tools** > **Options** > **Notifications**.
    2. Enter your MetaQuotes ID found in your MT4 Mobile App’s Settings.
    3. Enable “Enable Push Notifications” and confirm by clicking **OK**.

## Installation

1. **Download** or **clone** this repository.
2. Locate the `.mq4` file (`DrawdownNotification.mq4`).
3. Copy or move the `.mq4` file to your `Experts` folder:
    - In MT4, go to **File** > **Open Data Folder**.
    - Navigate to `MQL4` > `Experts`.
    - Paste the `.mq4` file into that folder.
4. **Compile** the `.mq4` file in MetaEditor to generate the `.ex4` file necessary for MT4 to run the EA (this often happens automatically when you attach the EA in MT4, but you can also manually compile).
5. **Restart** MetaTrader 4 or refresh the **Navigator** window so the EA appears in your Experts list.

## Usage

1. In MT4, **open your chart**.
2. In the **Navigator** window, expand **Expert Advisors**.
3. Drag and drop the `HighDrawdownAlert` (or the relevant `.mq4` file) onto the open chart.
4. In the **Inputs** tab, you can modify the `maxDrawdownAllowed` parameter if needed. For example, set it to `2500` if you wish to trigger alerts at a 2,500 currency-unit drawdown.
5. **Click OK** to apply and launch the EA. If your EA works you will see a smiley face :) on your chart.

## Input Parameters

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| **maxDrawdownAllowed** | double | `1500` | The drawdown threshold in your account’s currency. If your open losses cause drawdown to exceed this amount, the EA sends a notification and alert. |

## Important Notes

- Ensure you have **enabled Expert Advisors** in MT4 by clicking the **Auto Trading** button (if you need the EA to run automatically).
- Ensure you enable push notifications on your phone app, as it will not work otherwise.
- Drawdown is calculated as `Balance - Equity`, which reflects how much your open trades are currently losing relative to your balance. It does not measure “maximum historical drawdown”, which MT4’s detailed reports may show differently.
- If you want to track maximum historical drawdown or percentage-based drawdown, you’ll need additional logic to record the highest balance/equity over time and compare it to the current value. This EA focuses on real-time drawdown in currency terms. PM me if you need this and I can customise it for you depending on my free time :)
- Ensure that your bot works, as there may be errors in your config that cause it not to work. Don’t completely rely on this as it’s my hobby project that I am using right now.
