//+------------------------------------------------------------------+
//| OpenAllMarketWatchCharts.mq5                                     |
//| Opens a chart for every symbol visible in Market Watch           |
//+------------------------------------------------------------------+
#property script_show_inputs

input ENUM_TIMEFRAMES Timeframe = PERIOD_H1;

void OnStart()
{
   int total = SymbolsTotal(true); // true = Market Watch symbols only

   Print("Opening ", total, " charts...");

   for(int i = 0; i < total; i++)
   {
      string symbol = SymbolName(i, true);

      long chart_id = ChartOpen(symbol, Timeframe);

      if(chart_id > 0)
         Print("Opened: ", symbol);
      else
         Print("Failed: ", symbol);
   }

   Print("Done.");
}
