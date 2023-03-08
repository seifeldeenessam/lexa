# Lexa Wallet Mobile App

## Main Features

- Cards storing and sharing
- Payments & subscriptions management
- Loans tracking
- Wishlisting Items
- Balance management
- Savings tracking
- Wallet passcode lock
- Lock Wallet from any other device

---

## UI Design

[Figma](https://www.figma.com/file/5TygTQMxiBAP6LeRMjV17l/Z-Wallet?node-id=255%3A541&t=yPDNGNOLytWVXX8e-1)

---

## To Do

Global

- [ ] Update all screens inputs to the new ones
- [x] Add introduction carousel
- [ ] Optimize `phone_input.dart`
- [x] Change modal size to fit it's contents
- [x] Fix backspace and tick buttons in `number_pad.dart`
- [x] Move pickExpiryDate and pickExpiryTime to (\view_model\functions) folder
- [x] Try to minimize onOccurrenceDateChange and onExpiryDateChange functions
- [x] Create EmptyMessage widget
- [x] Use `Map` based state instead of multiple variables (Using models)
- [ ] Use `shared_prefrences`
- [x] Use `phosphor_flutter` instead of `.svg` files
- [ ] Use `google_fonts` instead of `.ttf` files

Authentication

- [x] Add country code selection
- [x] Add account currency selector
- [x] Add currency selector for each account

Balance

- [ ] Add saving tips
- [ ] Add transfares account to balance screen

Cards

- [ ] Add cards NFC scanning
- [ ] Add cards sharing
- [ ] Add cards capturing
- [x] Create `cards_create_screen.dart`

Transactions

- [ ] Substract transaction `price` from `billingAccount` current value
- [ ] Add transactions section total value
- [ ] Add bill scanning

Agreements

- [ ] Add installments feature
- [ ] Create `agreements_create_screen.dart`

Whislist

- [ ] Create `wishlist` database table
- [ ] Create `CRUD` operations on wishlist items

Profile

- [x] Add avatar selection modal
- [ ] The ability to lock the wallet (logout) from any device running the app

Backend

- [ ] Check if the device has a SIM card
- [ ] Create backend server

---

## Database tables

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

## How phone number verification will work

First the user will provide his phone numer in the `phone_entry_screen`, then a temporary token with unique random number will be generated and will be stored in the database `tokens` table.

Then the generated token will be sent to user's phone an a SMS message using **Twilio Services**.

If the users entered the correct token then his number will be verified, and then he can proceed the registeration process.

---

## How sessions will work

After the user is successfully logged in for the first time, a variable called `isLoggedIn` will be stored in the `shared_preferences` and set to `true`.

Then add a `token` in database `sessions` table caontains:

- User's phone number
- User's IP address
- status (active or not)

Each time the user opens the app a check will be performed to see if the `token` is existed in the database `sessions` table, if it is then the `isLoggedIn` variable will remain the same, else it will be set to `false`, which will automatically logout the user from the app

> And the same will hapen when the user tries to lock his wallet form any other device
