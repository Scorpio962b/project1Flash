
import { test, expect } from '@playwright/test';

test('Defect - Immediate payment option is not working', async ({ page }) => {

 await page.goto('http://localhost:4173/');
  await page.getByRole('link', { name: 'FlashGateway' }).click();
  await page.getByRole('link', { name: 'Sign In' }).nth(2).click();

// valid credentials
  await page.getByRole('textbox', { name: 'Email address' }).fill('admin@flashgateway.local');
  await page.getByRole('textbox', { name: 'Password' }).fill('Password123!');  

  await page.getByRole('button', { name: 'Sign In' }).click();
  await expect(page.getByRole('heading', { name: 'Portfolio Overview' })).toBeVisible({timeout :150000});
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
