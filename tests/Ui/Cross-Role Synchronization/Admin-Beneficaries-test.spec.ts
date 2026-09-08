import { test, expect } from '@playwright/test';
import { loginPage, } from '../../../pages/Admin-login-test';
test('Transfer funds to a saved beneficiary', async ({ page }) => {
 const adminLogin = new loginPage(page);
  
    await adminLogin.open();
    await adminLogin.login('admin@flashgateway.local','Password123!' ) 

  // Go to Transfers
  await page.getByRole('link', { name: 'Transfers' }).click();

  // Select saved beneficiary
  await page.getByText('Acme Supplies').click();

  // Enter transfer amount
  await page.getByLabel('Amount').fill('100');

  // Enter payment/reference
  await page.getByLabel('Reference').fill('inv-2024-002');

  // Verify the entered information before submitting
  await expect(page.getByText('Acme Supplies')).toBeVisible();
  await expect(page.getByLabel('Amount')).toHaveValue('100');
  await expect(page.getByLabel('Reference')).toHaveValue('inv-2024-002');

  // Submit transfer
  await page.getByRole('button', { name: /transfer|send|submit/i }).click();

  // Verify successful transfer
  await expect(
    page.getByText(/transfer successful|payment successful|success/i)
  ).toBeVisible();
});
