namespace Assignment_Four
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region Part 1

            // Q1 : What is the primary purpose of an interface in C#?
            // b) To define a blueprint for a class

            // Q2 : Which of the following is NOT a valid access modifier for interface members in C#?
            // a) private

            // Q3 : Can an interface contain fields in C#?
            // a) No

            // Q4 : In C#, can an interface inherit from another interface?
            // b) Yes, interfaces can inherit from multiple interfaces

            // Q5 : Which keyword is used to implement an interface in a class in C#?
            // d) implements

            // Q6 : Can an interface contain static methods in C#?
            // c) Yes  (C# 8.0+ allows static members.)

            // Q7 : In C#, can an interface have explicit access modifiers for its members?
            // b) No, all members are implicitly public

            // Q8 : What is the purpose of an explicit interface implementation in C#?
            // a) To hide the interface members from outside access

            // Q9 : In C#, can an interface have a constructor?
            // b) No, interfaces cannot have constructors

            // Q10 : How can a C# class implement multiple interfaces?
            // c) By separating interface names with commas


            #endregion

            #region Part 2

            #region Q1

            Circle circle = new Circle(10);
            Console.WriteLine(circle.DisplayShapeInfo());

            Rectangle rectangle = new Rectangle(10,20);
            Console.WriteLine(rectangle.DisplayShapeInfo());

            #endregion

            #region Q2 

            IAuthenticationService authenticationService = new AuthenticationService();

            bool isAuth = authenticationService.AuthenticateUser("admin", "1234");
            bool isAuthorized = authenticationService.AuthorizeUser("admin", "manager");

            Console.WriteLine("Authenticated: " + isAuth);
            Console.WriteLine("Authorized: " + isAuthorized);


            INotificationService email = new EmailNotificationService();
            INotificationService sms = new SmsNotificationService();
            INotificationService push = new PushNotificationService();

            email.SendNotification("asmaa@gmail.com", "Welcome!");
            sms.SendNotification("012345", "Your code is 1234");
            push.SendNotification("Asmaa", "You have a new message");


            #endregion

            #endregion
        }
    }
}
