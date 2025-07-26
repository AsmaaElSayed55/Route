
namespace Session_One.UserDefinedDataTypes
{
    // namespace -->
    // 1] enum  2] struct  3] class  4] interface
    // inside namespace --> [ 2 access modifiers ]
    // 1] internal --> by default  2] public
    internal class MyClass
    {
        // Class has 6 access modifiers

        // By default access modifier inside class --> private 

        // 1] attributes [field] 
        private int x;
        // 2] properties [ Automatic prop , full prop , indexer ]  
        public int Id { get; set; }
        // 3] events
        // 4] functions [ methods]
        internal void MyFun()
        {
            Console.WriteLine("Hello");
        }

    }
}
