import { test, expect } from '@playwright/test';
import { loginPage, } from '../../../pages/Merchant-login-test';
test('test', async ({ page }) => {
  test.setTimeout(150000)
  const merchantLogin = new loginPage(page);

  await merchantLogin.open();
  await merchantLogin.login('merchant@flashgateway.local','Password123!' )
  //proceed with payment
  await page.getByRole('link', { name: 'payments Transfer Funds' }).click();
  await page.getByRole('button', { name: 'One-off beneficiary Enter one' }).click();
  await page.getByRole('textbox', { name: 'Beneficiary Name' }).fill('Mother');
  await page.getByRole('textbox', { name: 'Bank' }).fill('Standard Bank');
  await page.getByRole('textbox', { name: 'Account Number' }).fill('556223450');
  await page.getByRole('spinbutton', { name: '0.00' }).fill('10');
  await page.getByRole('textbox', { name: 'e.g. Invoice INV-2024-' }).fill('Groceries');
  await page.getByRole('button', { name: 'lock Confirm & Transfer' }).click();
  await expect(page.getByText('Successful')).toBeVisible({timeout: 150000});
});
