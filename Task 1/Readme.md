ATM Interface using Servlet, JSP, and JDBC with MySQL

Project Overview

This project is an ATM Interface developed using Java Servlets, JSP, JDBC, and MySQL. The application allows users to interact with their bank accounts by performing transactions such as depositing money, withdrawing money, checking their balance, and exiting the session.

------> Technologies Used

Backend: Java Servlets, JDBC

Frontend: JSP, HTML, CSS

Database: MySQL

Server: Apache Tomcat

-----> Features

User Authentication: Users can log in and access their accounts securely.

Deposit Money: Allows users to deposit funds into their account.


Withdraw Money: Enables users to withdraw a specified amount, ensuring sufficient balance.

Check Balance: Displays the current balance of the user’s account.

Exit: Logs out the user and terminates the session.

__________________________________________________________________________________________________________________________________

JSP Pages

1. profile.jsp

Displays the user's account details including name and balance.

2. userform.jsp

A form that allows users to enter deposit and withdrawal amounts.


output 
![image](https://github.com/user-attachments/assets/123457cb-5e5e-4406-8bf1-628e4d288de3)

![image](https://github.com/user-attachments/assets/8bb135c2-4a92-444f-ae8d-ec4f857b6a0c)


![Screenshot 2025-02-15 191912](https://github.com/user-attachments/assets/d575e5b3-3e80-47ad-873b-dedb9a651928)


![Screenshot 2025-02-15 191942](https://github.com/user-attachments/assets/91f6d872-2c8f-4f13-8757-cdc0f3fa92e7)


![image](https://github.com/user-attachments/assets/aac34ad4-d7b1-4864-bd4b-09ff1882ae1c)


atmdemo
├── JAX-WS Web Services
│   └── src
│       └── main
│           └── java
│               └── in
│                   └── sp
│                       └── backend
│                           ├── AtmInterface.java
│                           ├── CheckBalance.java
│                           ├── DepositMoney.java
│                           ├── Exit.java
│                           └── WithdrawMoney.java
├── Libraries
│   └── Referenced Libraries
│       └── Brainwave_Matrix_Intern- [main] Create a .jar
├── build
├── src
│   └── java
│       └── webapp
│           ├── META-INF
│           ├── WEB-INF
│           │   └── lib
│           │       └── mysql-connector-j-9.2.0.jar
│           └── profile.jsp
│           └── welcome.jsp


