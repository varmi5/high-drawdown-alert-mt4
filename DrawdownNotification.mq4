// Declare global variables at the top of the script
bool alertSent = false;             // This variable will keep track of whether the alert has been sent
double maxDrawdownAllowed = 1500;   // Set the drawdown threshold in account currency (e.g., 2500 USD)
double currentBalance;              // Variable for tracking account balance
double currentEquity;               // Variable for tracking account equity
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
    alertSent = false;  // Initialize alert status
    return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
    // Get account balance and equity
    currentBalance = AccountBalance();
    currentEquity = AccountEquity();

    // Calculate drawdown in account currency
    double drawdown = currentBalance - currentEquity;

    // Check if drawdown exceeds 2500 and alert has not been sent yet
    if (drawdown >= maxDrawdownAllowed && !alertSent)
    {
        // Send notification to MT4 mobile app
        SendNotification("High Drawdown Alert: Drawdown has exceeded 1500 in account currency.");
        Alert("High Drawdown Alert: Drawdown has exceeded 1500 in account currency.");  // Optional: Displays alert in MT4 terminal
        alertSent = true;  // Set alert flag to avoid multiple notifications
    }

    // Reset alert flag if drawdown goes below 2500
    if (drawdown < maxDrawdownAllowed)
    {
        alertSent = false;
    }
}