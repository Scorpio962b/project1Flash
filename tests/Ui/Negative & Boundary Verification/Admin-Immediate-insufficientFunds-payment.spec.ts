import { test, expect } from '@playwright/test';
import { loginPage, } from '../../../pages/Admin-login-test';
test('Defect - Immediate payment option is not working', async ({ page }) => {
 const adminLogin = new loginPage(page);
 
   await adminLogin.open();
   await adminLogin.login('admin@flashgateway.local','Password123!' ) 
  // Go to Transfers
  await page.getByRole('link', { name: 'payments Transfer Funds' }).click();

  // Select saved beneficiary
  await page.getByRole('button', { name: 'SAVED BENEFICIARY Choose a' }).click();
  await page.getByRole('button', { name: 'Travel Co FNB •••• 4321 '}).click();

  // Enter transfer amount
  await page.getByRole('spinbutton', {name: '0.00'}).fill('50');

  // Enter reference
  await page.getByRole('textbox', {name : 'e.g. Invoice INV-2024-001'}).fill('inv-2024-003');

  // Click Immediate Payment
  await page.getByRole('button', { name: 'lock Confirm & Transfer' }).click();

  // Expected: immediate payment option should become selected
    await expect(page.getByRole('status').getByText('insufficient balance',)).toBeVisible();
});
