import { test, expect } from '@playwright/test';
import { loginPage, } from '../../../pages/Merchant-login-test';
test('test', async ({ page }) => {
  const merchantLogin = new loginPage(page);

  await merchantLogin.open();
  await merchantLogin.login('merchant@flashgateway.local','Password123!' )

  await page.getByRole('link', { name: 'phone_iphone Buy Airtime' }).click();
  await page.getByRole('button', { name: 'T Telkom' }).click();
  await page.getByRole('textbox', { name: '000 0000' }).click();
  await page.getByRole('textbox', { name: '000 0000' }).fill('658525685');
  await page.getByRole('spinbutton', { name: '0.00' }).click();
  await page.getByRole('spinbutton', { name: '0.00' }).click();
  await page.getByRole('spinbutton', { name: '0.00' }).fill('150');
  await page.getByRole('button', { name: 'Review Payment arrow_forward' }).click();
  await page.getByRole('button', { name: 'Confirm Payment' }).click();
});
