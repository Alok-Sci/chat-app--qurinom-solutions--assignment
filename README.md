# Chat App - Qurinom Solutions Assignment

This app/project is an assignment task which I(Alok Singh) am creating in order to complete this assignment round.


## Task Details:

1. Create an application with a login functionality with two different types of user login methods.
    - Customer
    - Vendor
2. The Home page will be a list of the chats that the customer or vendor has done (List of chats)
3. Open a Specific chat and call an API to retrieve the chat history between the two users.
4. Call the socket to send a message to the Vendor or the customer.
5. For development, you should use Bloc as State management and MVVM as an architecture.

## APIs to be used:

**Endpoints:**
    1. Login: 
        - route - user/login      

        - body - {
            "email": "swaroop.vass@gmail.com",
            "password": "@Tyrion99",
            "role": "vendor"
         }


    2. Send message:
        - route - messages/sendMessage
        - body -  {
            "chatId": "679bbd688c09df5b75cd1070",
            "senderId": "673d80bc2330e08c323f4393",
            "content": "Hello!!!",
            "messageType": "text",
            "fileUrl": ""
        }

    3. Get chat details (by chatId):
        - route - messages/get-messagesformobile:chatId
        - chatId - 679bbd688c09df5b75cd1070

    4. Get chats (by userId):
        - route: chats/user-chats/:userId          


## Screens
1. Login Screen - to log in the customer or vendor (conditionally)
2. Home Screen - having all the chats that the user had with other users
3. Chat Detail Screen - displays all messages for a specific chat; at the bottom of the screen display a textfield to send messages (support files as well)

## Pre-requisites
- BLoC - State Management
- MVVM - Project Architecture
- WebSocket - BiDirectional Communication