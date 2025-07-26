using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Session_One.UserDefinedDataTypes
{
    internal enum MyEnum 
    {
        // Has no access modifier --> Label [predefined constants]
        label1,
        label2,
        label3,
        label4
    }
    enum WeekDays 
    { 
        Saturday = 1,
        Sunday = 2,
        Monday=3,
        Tuesday=4,
        Wednesday=5,
        Thursday=6,
        Friday=7
    }
    internal enum Gender
    {
        Male=0,
        Female=1
    }
}
