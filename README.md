# 🚀 Flash Gateway — Quality Engineering Project

A fintech Quality Engineering and Test Automation project focused on testing a merchant payment and financial management system across the **UI, API, and database layers**.

## 📌 About the Project

Flash Gateway is a practical Quality Engineering project where I tested a fintech application from multiple levels to make sure the system works correctly and that financial data remains accurate.

The project covers:

- 🖥️ UI / End-to-End Testing
- 🔌 API Testing
- 🗄️ SQL / Database Testing
- 🔐 Authentication & RBAC
- 💰 Financial Reconciliation
- 💳 Merchant Transactions
- 💸 Wallet & Settlement Validation
- ❌ Negative & Boundary Testing

The main goal was not only to check whether the application works from the user's side, but also to validate the **API responses and database records behind the application**.

## 🧪 Testing Approach

The project follows a three-layer testing approach:

```text
              FLASH GATEWAY
                    │
       ┌────────────┼────────────┐
       │            │            │
       ▼            ▼            ▼
      UI           API          SQL
       │            │            │
   Playwright    API Tests    Database Tests
       │            │            │
       └────────────┼────────────┘
                    ▼
             Financial Validation
```

## 🖥️ UI Testing

UI automation was created using **Playwright + TypeScript**.

### Merchant Testing

- Valid Login
- Invalid Login
- Beneficiary Management
- Airtime Purchases
- Scheduled Payments
- Wallet Balance Validation
- Insufficient Balance Scenarios
- Notifications
- Merchant Payment Flows

### Admin Testing

- Admin Login
- Invalid Admin Credentials
- Admin Wallet / Balance Validation
- Beneficiary Management
- Airtime Purchases
- Scheduled Payments
- Notifications
- Insufficient Balance Scenarios
- Cross-Role Synchronisation

### Negative & Boundary Testing

- Invalid username
- Invalid password
- Invalid email
- Invalid credentials
- Insufficient wallet balance
- Insufficient funds for transactions

## 🔌 API Testing

API testing was used to validate backend functionality and business rules.

### Merchant Lifecycle

- Merchant registration
- Duplicate merchant details
- Merchant login
- Merchant wallet information
- Beneficiaries
- Payment methods
- Merchant status

### Financial Distribution Logic

- Wallet transactions
- Credits and debits
- Merchant purchases
- Settlement information
- Financial calculations
- Transaction reconciliation

### Identity & RBAC

- Admin access
- Merchant access
- Protected endpoints
- Role permissions
- Transaction ownership
- Settlement access

## 🗄️ SQL / Database Testing

SQL testing was used to verify the data stored behind the application.

### Financial Reconciliation

- Wallet balances
- Completed credits
- Completed debits
- Transaction records
- Settlement totals
- Merchant financial records
- Duplicate financial records

### Settlement Math Verification

- Settlement amounts
- Settlement totals
- Commission calculations
- Credit totals
- Debit totals
- Net wallet movement

### Data Hygiene & Constraints

- Duplicate merchant emails
- Duplicate MSISDNs
- Missing transaction information
- Invalid records
- Missing payment information

### Business Intelligence Reports

- Transaction totals
- Merchant performance
- Product information
- Settlement totals
- Wallet balances
- Transaction counts

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| **TypeScript** | Test automation |
| **Playwright** | UI / E2E testing |
| **SQL** | Database testing |
| **JSON** | API test data & responses |
| **Git** | Version control |
| **GitHub** | Collaboration & repository management |
| **VS Code** | Development environment |

## 📂 Project Structure

```text
project1Flash/
│
├── pages/
│   ├── Admin-login-test.ts
│   └── Merchant-login-test.ts
│
├── tests/
│   ├── Api/
│   │   ├── Financial Distribution Logic/
│   │   ├── Identity and RBAC/
│   │   └── Merchant Life Cycle/
│   │
│   ├── SQL/
│   │   ├── Business Intelligence Reports/
│   │   ├── Data Hygiene & Constraints/
│   │   ├── Financial Reconciliation/
│   │   └── Settlement Math Verification/
│   │
│   └── Ui/
│       ├── Cross-Role Synchronization/
│       ├── Merchant "Happy Path"/
│       └── Negative & Boundary Verification/
│
├── playwright.config.ts
├── package.json
└── README.md
```

## ▶️ Running the Project

### Install dependencies

```bash
npm install
```

### Install Playwright browsers

```bash
npx playwright install
```

### Run all Playwright tests

```bash
npx playwright test
```

### Run tests with the browser visible

```bash
npx playwright test --headed
```

### View the Playwright report

```bash
npx playwright show-report
```

## 🎯 What This Project Demonstrates

- Quality Engineering
- Manual & Automated Testing
- Test Case Design
- End-to-End Testing
- API Testing
- Database Testing
- SQL Validation
- Financial Reconciliation
- RBAC Testing
- Negative Testing
- Boundary Testing
- Playwright Automation
- TypeScript
- Git & GitHub
- Debugging
- Test Reporting
---

⭐ **This project was created as part of our Quality Engineering journey and demonstrates our practical experience testing a fintech application across the UI, API, and database layers.**
