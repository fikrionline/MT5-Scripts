//+------------------------------------------------------------------+
//| CloseAllOrdersAndPositions.mq5                                   |
//| Menutup semua posisi dan menghapus semua pending order           |
//+------------------------------------------------------------------+
#property script_show_inputs

#include <Trade/Trade.mqh>

CTrade trade;

//+------------------------------------------------------------------+
//| Script start function                                            |
//+------------------------------------------------------------------+
void OnStart()
{
   //--- Hapus semua pending order
   int total_orders = OrdersTotal();

   for(int i = total_orders - 1; i >= 0; i--)
   {
      ulong ticket = OrderGetTicket(i);

      if(ticket > 0)
      {
         if(trade.OrderDelete(ticket))
            Print("Pending order deleted: ", ticket);
         else
            Print("Failed to delete pending order: ", ticket,
                  " Error: ", GetLastError());
      }
   }

   //--- Tutup semua posisi terbuka
   int total_positions = PositionsTotal();

   for(int i = total_positions - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);

      if(ticket > 0)
      {
         if(trade.PositionClose(ticket))
            Print("Position closed: ", ticket);
         else
            Print("Failed to close position: ", ticket,
                  " Error: ", GetLastError());
      }
   }

   Print("=== Finished: all positions closed and all pending orders deleted ===");
}
//+------------------------------------------------------------------+
