import { test, expect } from '@playwright/test';
import { loginPage, } from '../../../pages/Merchant-login-test';

test('Main balance decreases after successful transfer', async ({ page }) => {
   const merchantLogin = new loginPage(page);

  await merchantLogin.open();
  await merchantLogin.login('merchant@flashgateway.local','Password123!' )
  // Check the main account balance before making the transfer
  const mainBalance = page.getByTestId('main-balance');
  await expect(mainBalance).toHaveText('R5,000');
  // Go to Transfers
  await page.getByRole('link', { name: 'Transfers' }).click();
  // Select saved beneficiary
  await page.getByText('Acme Supplies').click();
  // Enter transfer amount
  await page.getByLabel('Amount').fill('100');
  // Enter reference
  await page.getByLabel('Reference').fill('inv-2024-002');
  // Make the transfer
  await page.getByRole('button', { name: /Transfer|Send|Submit/i }).click();
  // Verify that the transfer was successful
  await expect(
    page.getByText(/transaction successful|transfer successful|payment successful/i)
  ).toBeVisible();
  // Verify that the MAIN BALANCE has decreased
  await expect(mainBalance).toHaveText('R4,900');
  // Confirm that R100 was deducted from the main balance
  const balanceBefore = 5000;
  const balanceAfter = 4900;
  expect(balanceBefore - balanceAfter).toBe(100);
});
