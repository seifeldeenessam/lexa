# Lexa Wallet Mobile App

### Main Features

- Cards storing and sharing
- Payments & subscriptions management
- Loans tracking
- Adding items to wishlist
- Balance management
- Savings tracking
- Wallet PINCode lock
- Lock Wallet from any other device

---

### UI Design built using [Figma](https://www.figma.com/file/5TygTQMxiBAP6LeRMjV17l/Z-Wallet?node-id=255%3A541&t=yPDNGNOLytWVXX8e-1)

---

### To Do

Global

1. [ ] Update all screens inputs to the new ones
2. [x] Add introduction carousel
3. [ ] Optimize `phone_input.dart`
4. [x] Change modal size to fit it's contents
5. [x] Fix backspace and tick buttons in `number_pad.dart`
6. [x] Move pickExpiryDate and pickExpiryTime to (\view_model\functions) folder
7. [x] Try to minimize onOccurrenceDateChange and onExpiryDateChange functions
8. [x] Create EmptyMessage widget
9. [x] Use `Map` based state instead of multiple variables (Using models)
10. [ ] Use `shared_preferences`
11. [x] Use `phosphor_flutter` instead of `.svg` files
12. [ ] Use `google_fonts` instead of `.ttf` files

Authentication

1. [x] Add country code selection
2. [x] Add account currency selector
3. [x] Add currency selector for each account

Balance

1. [ ] Add saving tips
2. [ ] Add transfers account to balance screen

Cards

1. [ ] Add cards NFC scanning
2. [ ] Add cards sharing
3. [ ] Add cards capturing
4. [x] Create `cards_create_screen.dart`

Transactions

1. [ ] Subtract transaction `price` from `billingAccount` current value
2. [ ] Add transactions section total value
3. [ ] Add bill scanning

Agreements

1. [ ] Add installments feature
2. [ ] Create `agreements_create_screen.dart`

Wishlist

1. [ ] Create `wishlist` database table
2. [ ] Create `CRUD` operations on wishlist items

Profile

1. [x] Add avatar selection modal
2. [ ] The ability to lock the wallet (logout) from any device running the app

Backend

1. [ ] Check if the device has a SIM card
2. [ ] Create backend server

---

### Database tables

- users
- tokens
- sessions
- payments
- subscriptions
- savings
- cards
- loans
- wishlist

---

### How phone number verification will work

First the user will provide his phone number in the `phone_entry_screen`, then a temporary token with unique random number will be generated and will be stored in the database `tokens` table.

Then the generated token will be sent to user's phone an a SMS message using **Twilio Services**.

If the users entered the correct token then his number will be verified, and then he can proceed the registration process.

---

### How sessions will work

After the user is successfully logged in for the first time, a variable called `isLoggedIn` will be stored in the `shared_preferences` and set to `true`.

Then add a `token` in database `sessions` table contains:

- User's phone number
- User's IP address
- status (active or not)

Each time the user opens the app a check will be performed to see if the `token` is existed in the database `sessions` table, if it is then the `isLoggedIn` variable will remain the same, else it will be set to `false`, which will automatically logout the user from the app

> And the same will happen when the user tries to lock his wallet form any other device
